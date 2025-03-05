#include <stdio.h>

#define MAX_SIZE 10

int search(int array[], int size, int value) {
	for (int i = 0; i < size; i++) {
		if (array[i] == value) {
			return i; //return the index of the value if found
		}
	}
	return -1; //if not found
}

int main() {
	int arr[MAX_SIZE] = { 0 }; //initalize the array
	int count = 0, num;

	printf("Enter a positive number up to 10 (or a number that is <= 0 to stop early:\n");
	for (int i = 0; i < MAX_SIZE; i++) {
		printf("Enter an integer %d: \n", i + 1);
		scanf_s("%d", &num);
		if (num <= 0) {
			break; //stop the program if the answer is 0 or negative
		}
		arr[i] = num; 
		count++;
	}

	//searching makes me feel so sigma!
	printf("Enter a value to search for: ");
	scanf_s("%d", &num);
	int position = search(arr, count, num);

	//display the result
	if (position != 1) {
		printf("Value %d found at position %d.\n", num, position);
	}
	else {
		printf("Value %d not found in the array.\n", num);

	}

	return 0;
}