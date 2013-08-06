/* SCI */
#define DPS_SCI 0x100
#define DPS_SCITXD 0x100
#define DPS_SCIRXD 0x104
#define DPS_SCICFG 0x108

#define SCIRXD_VALID 0x80000000
#define SCICFG_TEN 0x1
#define SCICFG_REN 0x2
#define SCICFG_TCLR 0x1000
#define SCICFG_RCLR 0x2000
#define SCICFG_BDR_OFFSET 2
#define SCICFG_TIRE_MASK 0x1c0
#define SCICFG_TIRE_OFFSET 6
#define SCICFG_RIRE_MASK 0xe00
#define SCICFG_RIRE_OFFSET 9

#define OFFSET_BYTE(base, nbytes) ((void *)((char *)base + nbytes))

static inline __attribute__((always_inline)) void *_mist32_iosr(void)
{
  void *io;

  __asm__("sriosr %0" : "=r"(io));

  return io;
}
