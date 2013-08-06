#include <sys/types.h>
#include <sys/stat.h>
#include "syscall.h"
#include "trap.h"

int
_kill (int pid, int sig)
{
  return TRAP0 (SYS_exit, 0xdead, 0, 0);
}
