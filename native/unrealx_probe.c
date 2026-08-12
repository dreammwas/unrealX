/* Optional native probe source. Runtime package intentionally does not ship a host-built ELF. Compile with an Android NDK for the target ABI, then install the result as bin/unrealx_probe. */
#include <stdio.h>
#include <unistd.h>
int main(void){ printf("unrealX native probe: read-only placeholder; compile for target Android ABI.\n"); return 0; }
