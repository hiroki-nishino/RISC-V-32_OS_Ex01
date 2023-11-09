typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef uint32_t size_t;

#define __noreturn __attribute__((noreturn))

static inline uint32_t read_mhartid(void) {
    uint32_t value;
    __asm__ __volatile__("csrr %0, mhartid" : "=r"(value));
    return value;
}