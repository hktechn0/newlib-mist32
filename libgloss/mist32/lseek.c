#include <sys/types.h>
#include <sys/stat.h>
#include "syscall.h"
#include "trap.h"

int
_lseek (int file, int ptr, int dir)
{
  return TRAP0 (SYS_lseek, file, ptr, dir);
}
