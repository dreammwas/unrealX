const UX_EMOJI={
  success:'assets/emoji/emoji_00.webm', friendly:'assets/emoji/emoji_01.webm',
  action:'assets/emoji/emoji_02.webm', positive:'assets/emoji/emoji_03.webm',
  favorite:'assets/emoji/emoji_04.webm', neutral:'assets/emoji/emoji_05.webm',
  warning:'assets/emoji/emoji_06.webm', celebration:'assets/emoji/emoji_07.webm',
  info:'assets/emoji/emoji_08.webm', error:'assets/emoji/emoji_09.webm'
};

const $=s=>document.querySelector(s);
const profileNames=['realistic','cinematic','ultra','balanced','performance','battery'];
let execFn=null;
let apiMode='read-only';

function setStatusEmoji(role){
  const el=$('#statusEmoji');
  if(!el)return;
  el.src=UX_EMOJI[role]||UX_EMOJI.info;
  el.load();
}

async function loadPrivilegedApi(){
  // Official KernelSU API: import { exec } from 'kernelsu'.
  try{
    const mod=await import('kernelsu');
    if(typeof mod.exec==='function'){
      execFn=async cmd=>{
        const r=await mod.exec(cmd);
        return r?.stdout||r?.stderr||'';
      };
      apiMode='kernelsu';
      return;
    }
  }catch(_){}

  // Compatibility with standalone WebUI implementations exposing a ksu bridge.
  try{
    if(window.ksu && typeof window.ksu.exec==='function'){
      execFn=async cmd=>{
        const r=await window.ksu.exec(cmd);
        return typeof r==='string'?r:(r?.stdout||r?.stderr||'');
      };
      apiMode='ksu-bridge';
      return;
    }
  }catch(_){}

  apiMode='read-only';
}

async function exec(cmd){
  if(!execFn){
    $('#out').textContent='Read-only WebUI bridge: this manager does not expose privileged JavaScript execution. Status remains available; use unrealX CLI or a compatible WebUI host for actions.';
    return '';
  }
  try{
    const out=await execFn(cmd);
    $('#out').textContent=out||'Done';
    return out||'';
  }catch(e){
    $('#out').textContent=String(e);
    return '';
  }
}

async function readState(){
  try{
    const r=await fetch('state.txt?ts='+Date.now(),{cache:'no-store'});
    if(!r.ok)throw new Error('state.txt HTTP '+r.status);
    const text=await r.text();
    const m={};
    for(const line of text.split(/\r?\n/)){
      const i=line.indexOf('=');
      if(i>0)m[line.slice(0,i).trim()]=line.slice(i+1).trim();
    }
    return m;
  }catch(_){
    return {};
  }
}

function drawProfiles(){
  const el=$('#profiles');
  el.innerHTML='';
  profileNames.forEach(p=>{
    const b=document.createElement('button');
    b.textContent=p.toUpperCase();
    b.disabled=!execFn;
    b.title=execFn?'Apply profile':'Privileged WebUI API unavailable';
    b.onclick=async()=>{await exec(`/data/adb/modules/unrealx/bin/unrealX profile ${p}`);await refresh()};
    el.appendChild(b);
  });
}

function renderState(st){
  const profile=st.profile||'UNKNOWN';
  const root=st.root_manager||'UNKNOWN';
  const thermal=st.thermal_state||'UNKNOWN';
  const adaptive=st.adaptive_state||'SAFE_UNKNOWN';
  const gpu=st.gpu_renderer||st.gpu_vendor||'UNKNOWN';

  $('#stateTitle').textContent=profile.toUpperCase();
  $('#root').textContent=root;
  $('#thermal').textContent=thermal;
  $('#adaptive').textContent=adaptive;
  $('#metrics').innerHTML=[
    ['GPU',gpu],['Profile',profile.toUpperCase()],['Adaptive',adaptive]
  ].map(([a,b])=>`<div class="metric"><b>${a}</b><span>${b||'Not available'}</span></div>`).join('');
  $('#details').innerHTML=[
    ['Device',st.manufacturer&&st.device_model?`${st.manufacturer} ${st.device_model}`:(st.device_model||'Not available')],
    ['Android',st.android||'Not available'],
    ['Kernel',st.kernel||'Not available'],
    ['RAM',st.ram_kb&&Number(st.ram_kb)>0?`${(Number(st.ram_kb)/1024/1024).toFixed(1)} GB`:'Not available'],
    ['Graphics interface',st.graphics_interfaces||'UNKNOWN'],
    ['Thermal interface',st.thermal_interface||'UNKNOWN']
  ].map(([a,b])=>`<div class="detail"><span>${a}</span><b>${b}</b></div>`).join('');

  const t=Number(st.temperature_millic);
  $('#temp').textContent=Number.isFinite(t)&&t>0?`${(t/1000).toFixed(1)} °C`:'Not available';
  $('#out').dataset.apiMode=apiMode;
  if(apiMode==='read-only'){
    $('#out').textContent='Status bridge unavailable; showing verified boot state from unrealX.';
  }
  setStatusEmoji(
    thermal==='CRITICAL_THERMAL'||thermal==='THERMAL_PRESSURE'?'warning':
    thermal==='UNKNOWN'?'neutral':'info'
  );
}

async function refresh(){
  const st=await readState();
  renderState(st);
  if(execFn){
    const out=await exec('/data/adb/modules/unrealx/bin/unrealX detect');
    if(out)renderState(await readState());
  }
}

document.addEventListener('click',e=>{
  const c=e.target?.dataset?.cmd;
  if(c)exec(`/data/adb/modules/unrealx/bin/unrealX ${c}`).then(refresh);
});

(async()=>{
  drawProfiles();
  await loadPrivilegedApi();
  drawProfiles();
  await refresh();
  setStatusEmoji('info');
})();
