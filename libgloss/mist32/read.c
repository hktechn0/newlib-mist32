#include <sys/types.h>
#include <sys/stat.h>
#include "syscall.h"
#include "trap.h"

#include "mist32.h"

int
_read (int fd, char *buf, int len)
{
  unsigned int *cfg, *rxd, i, data;

  cfg = OFFSET_BYTE(_mist32_iosr(), DPS_SCICFG);
  *cfg |= SCICFG_REN;

  rxd = OFFSET_BYTE(_mist32_iosr(), DPS_SCIRXD);

  for (i = 0; i < len; i++) {
    data = *rxd;

    if (data & SCIRXD_VALID)
      buf[i] = data & 0xff;
    else
      break;
  }

  return i;
}
