#include <stdio.h>

int main() {
	int grade; 

	printf("Enter the student's grade (an integer between 0-100): ");
	if (scanf_s("%d", &grade) != 1) {
		printf("Invalid input. The program will now stop.");
		return 0;
	}

	if (grade < 0 || grade > 100) {
		printf("Invalid input. The program will now stop.");
		return 0;
	}

	if (grade >= 90) {
		printf("Grade:A \n");
	}
	else if (grade >= 80) {
		printf("Grade: B\n");
	}
	else if (grade >= 70) {
		printf("Grade: C\n");
	}
	else if (grade >= 60) {
		printf("Grade: D\n");
	}
	else {
		printf("Grade: F\n");
	}

	return 0;
}
