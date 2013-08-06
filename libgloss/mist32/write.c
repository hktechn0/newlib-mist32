#include <sys/types.h>
#include <sys/stat.h>
#include "syscall.h"
#include "trap.h"

#include "mist32.h"

int
_write (int fd, char *buf, int len)
{
  unsigned int *cfg, *txd, i;

  cfg = OFFSET_BYTE(_mist32_iosr(), DPS_SCICFG);
  *cfg |= SCICFG_TEN;

  txd = OFFSET_BYTE(_mist32_iosr(), DPS_SCITXD);

  for(i = 0; i < len; i++) {
    *txd = buf[i];
  }

  return len;
}
