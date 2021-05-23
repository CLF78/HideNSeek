SECTIONS {
	.text 0x808DD400 : {
		*(.loader*)
		
		*(.text*)
		*(.data*)
		*(.sdata*)
		*(.rodata*)
		*(.bss*)
		*(.sbss*)
		. = ALIGN(32);
	}
	/DISCARD/ : {
		*(*)
	}
}
