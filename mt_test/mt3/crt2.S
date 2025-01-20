.section .data
location0: .word 0   # Memory location for hart ID = 0
location1: .word 0   # Memory location for hart ID != 0

.section .text
.globl _start
_start:
    csrrs	x10,mhartid,x0			# load my hart ID into 0x10
    beq x10, x0, store_to_loc0 # If hart ID == 0, branch to store_to_loc0
    la x12, location1           # Load address of location1 into x12
    sw x10, 0(x12)              # Store hart ID in location1
    lw x13, 0(x12)              # Load waht stored
    j end                       # Jump to end

store_to_loc0:
    la x12, location0           # Load address of location0 into x12
    sw x10, 0(x12)              # Store hart ID in location0
    lw x14, 0(x12)              # Load waht stored

end:
    # Infinite loop to stop the program
    j end

