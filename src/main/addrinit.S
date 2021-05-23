.section .loader


.extern loadCodes
.global FileHeader

# As this file will be the first in the compiled blob, it will point to the start function, which the bootstrap will load and then call
FileHeader:
.long loadCodes

.section .text
