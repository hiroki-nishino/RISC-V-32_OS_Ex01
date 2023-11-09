OUTPUT_ARCH("riscv")
/* 
// エントリーポイントをアセンブリで書いた`_start`に設定する */
ENTRY(_start)

SECTIONS
{
    /* sifive_uのエントリーポイントアドレス */
    . = 0x80000000;

    /* text: Program code section */
    .text :
    {
        /* これで0x80000000に.bootセクションが配置される */
        *(.boot)
        *(.text .text.*)
    }

    /* rodata: Read-only data */
    .rodata :
    {
        *(.rdata .rodata .rodata.*)
    }

    /* data: Writable data */
    .data :
    {
        *(.data .data.*)
    }

    .bss :
    {
        *(.bss bss.*)
    }
}