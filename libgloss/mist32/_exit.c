#include <limits.h>

void _exit (int rc)
{
  /* Default stub just causes a divide by 0 exception.  */
  int x = rc / INT_MAX;
  x = 4 / x;

  /* Convince GCC that this function never returns.  */
  for (;;)
    ;
}
