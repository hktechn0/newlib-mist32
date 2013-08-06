#include <sys/time.h>
#include <sys/times.h>

time_t
_time (time_t *t)
{
  return -1;
}

int
_times (struct tms *buf)
{
  int clk;

  __asm__("srfrcr\n\t"
          "srfrclr %0"
	  : "=r"(clk));

  if(buf) {
    buf->tms_utime = clk;
    buf->tms_stime = 0;
    buf->tms_cutime = 0;
    buf->tms_cstime = 0;
  }

  return clk;
}
