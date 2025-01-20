.section .data
location0: .word 0   # Memory location for hart ID = 0
location1: .word 0   # Memory location for hart ID != 0

#define FIFO_ADDR_TX 0xe0001030

.section .text
.globl _start
_start:
    csrrs	x10,mhartid,x0			# load my hart ID into x10
    bne x10, x0, store_to_loc0      # If hart ID == 0, branch to store_to_loc0
    li x12, FIFO_ADDR_TX            # load the uart base address to x12
    addi x13,x10,48
    sw x13, 0(x12)                  # Store hart ID in uart buffer core 0
    j end                           # Jump to end

store_to_loc0:
    li x12, FIFO_ADDR_TX        # load the uart base address to x12
    addi x14,x10,48
    sw x14, 0(x12)              # Store hart ID in uart buffer core 1

end:
    # Infinite loop to stop the program
    j end

#.section .data
#uart_base: .word 0xe0001030        # UART base address (FIFO_ADDR_TX)
#message:  .asciz "hello world\n"  # Null-terminated string to send

#.section .text
#.globl _start

#_start:
    #la t0, message                # Load address of the message
    #lw t1, uart_base              # Load the UART FIFO base address

#write_loop:
    #lb t2, 0(t0)                  # Load the next byte of the message
    #beqz t2, end                  # If byte is 0 (null terminator), exit loop
    #sb t2, 0(t1)                  # Write the byte to the UART FIFO
    #addi t0, t0, 1                # Increment message pointer
    #j write_loop                  # Repeat for next character

#end:
    #j end                         # Infinite loop to prevent exit
