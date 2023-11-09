.option norvc
// .bootセクション
.section .boot, "ax",@progbits
.global _start
.global abort

_start:
    /* Set up stack pointer. */
    lui     sp, %hi(stacks + 1024)
    ori     sp, sp, %lo(stacks + 1024)
    /* Now jump to the rust world; __start_rust.  */
hoge:
    csrr a0, mhartid
    mv t0, a0
    
    beq t0, zero, cpu_id_zero
    li t1, 1
    beq t0, t1, cpu_id_one
    li t1, 2
    beq t0, t1, cpu_id_two
    li t1, 3
    beq t0, t1, cpu_id_three

cpu_id_three:
    j cpu_id_three
cpu_id_two:
    j cpu_id_two
cpu_id_one:
    j cpu_id_one
cpu_id_zero:
    j cpu_id_zero

.bss

.global stacks
stacks:
    .skip 1024