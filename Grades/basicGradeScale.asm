.386
.model flat, stdcall
.stack 4096

include windows.inc
include kernel32.inc
include user32.inc
includelib kernel32.lib
includelib user32.lib

.data
	promptMessage db "Enter the student's grade (an integer between 0 and 100): ", 0
	errorMessage db "Invalid input. Exiting...", 0
	gradeA db "Grade: A", 0
	gradeB db "Grade: B", 0
	gradeC db "Grade: C", 0
	gradeD db "Grade: D", 0
	gradeF db "Grade: F", 0
	buffer db dup(10)
	bytesRead dd ?
	number dd ?

.code
main PROC c
	;display the input prompt
	INVOKE StdOut, ADDR promptMessage
	INVOKE StdIn, ADDR buffer, 10
	INVOKE atodw, ADDR buffer ;converting the string to the integer
	mov number, eax

	;check if the number is within range
	cmp eax, 0
	jl invalidInput
	cmp eax, 100
	jg invalidInput

	;determining the letter grade
	cmp eax, 90
	jge gradeA_label
	cmp eax, 80
	jge gradeB_label
	cmp eax, 70
	jge gradeC_label
	cmp eax, 60
	jge gradeD_label
	jmp gradeF_label

gradeA_label:
	INVOKE StdOut, ADDR gradeA
	jmp exit
gradeB_label: 
	INVOKE StdOut, ADDR gradeB
	jmp exit
gradeC_label:
	INVOKE StdOut, ADDR gradeC
	jmp exit
gradeD_label:
	INVOKE StdOut, ADDR gradeD
	jmp exit
gradeF_label:
	INVOKE StdOut, ADDR gradeF
	jmp exit

invalidInput:
	INVOKE StdOut, ADDR errorMessage

exit:
	INVOKE ExitProcess, 0

main ENDP
END main
