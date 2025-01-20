#include "hartid.h"

// void uart_char(char c)
// {
// 	uint32_t *uart = 0xe0001030;
// 	uint32_t *uart_status = 0xe000102c;

// 	while ((*uart_status) & 16)
// 		;

// 	*uart = (int)c;
// 	// putchar(c);
// }

// #define FIFO_ADDR_TX 0xe0001030
// #define FIFO_ADDR_RX 0xe000102c
// #define UART_TX_BUSY 0x10  // Bit 4 indicates TX busy

// void uart_char(char c) {
//     volatile int *uart = (volatile int *)FIFO_ADDR_TX;
//     volatile int *uart_status = (volatile int *)FIFO_ADDR_RX;

//     // // Wait until the TX FIFO is not busy
//     // while ((*uart_status) & UART_TX_BUSY)
//     //     ;

//     // Write the character to the TX FIFO
//     *uart = (int)c;
// }



// int main()
// {
// 	uint64_t core_id = get_hartid();
	
// 	uart_char((char)core_id);  // Print least significant byte of hart ID

// 	return 0;

// 	// return get_hartid();
// }


#define FIFO_ADDR_TX 0xe0001030

// Declaring the function as volatile
__attribute__((noinline))
void uart_char(volatile char c) {
    volatile int *uart = (volatile int *)FIFO_ADDR_TX;

    // Write the character to the TX FIFO
    *uart = (int)c;
}


int main() {
    uint64_t core_id = get_hartid();

    uart_char((volatile char)(core_id & 0xFF)); // Print least significant byte of hart ID

    return 0;
}




