#include <sys/types.h>
#include <sys/stat.h>
#include "syscall.h"
#include "trap.h"

void _exit (int rc)
{
  return TRAP0 (SYS_exit, rc, 0, 0);
}
