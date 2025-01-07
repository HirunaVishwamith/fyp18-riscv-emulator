#include "hartid.h"
#include ""


int main()
{
	uint64_t core_id;
	core_id = get_hartid();
	printf("Hart ID: %lu\n", core_id); // Print the hart ID
	return 0;
}
