.386
.model flat, stdcall
.stack 4096

includelib libcmt.lib
includelib legacy_stdio_definitions.lib

ExitProcess PROTO, dwExitCode:DWORD
extern printf:NEAR

.data
	repeatedString BYTE "This string is repeated with each iteration.", 0
	counter DWORD 0

.code 
main PROC c
	mov ecx, counter
	
	StartOfLoop:
		;checking the conditional
		cmp counter, 5
		jge EndOfLoop
		
		;printing the string
		push offset repeatedString
		call printf
		add esp, 4

		;incrementing the counter
		add ecx, 1

		jmp StartOfLoop

	EndOfLoop:
		INVOKE ExitProcess, 0

main endp
end