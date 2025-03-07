.386
.model flat, stdcall
.stack 4096

includelib libcmt.lib
includelib legacy_stdio_definitions.lib

ExitProcess PROTO, dwExitCode:DWORD

extern printf:NEAR
extern scanf:NEAR

.data 
	;prompts
	prompt1 db "Enter a number up to 10 positive integers (enter 0 or -1 to stop early): ", 0Ah, 0
	prompt2 db "Enter a number: ", 0 ;adding to the array
	prompt3 db "Enter a number to search for: ", 0
	
	;messages 
	notFoundMessage db "Number not found at position: %d.", 0Ah, 0
	foundMessage db "NUmber found at position: %d", 0Ah, 0

	;other things
	formatSpecifier db "%d", 0
	newLine db 0Ah, 0

.code
main PROC c
	;function prologue
	push ebp
	mov ebp, esp
	sub esp, 48

	;print the first prompt
	pushad
	lea eax, prompt1
	call printf
	add esp, 4
	popad

	;Initalize the array 
	lea edi, [ebp-48]
	mov ecx, 10
	xor eax, eax

	InitalizeArray:
		mov [edi], eax
		add edi, 4
		dec ecx
		jnz InitalizeArray 

	inputLoop:
		cmp ecx, 10 ;checking to see if the array has reached the right size
		jge stopInputLoop

		;printing the number that was entered
		pushad
		lea eax, prompt2
		push eax
		call printf
		add esp, 4
		popad

		;Scan the user input for the integer
		pushad
		lea eax, formatSpecifier
		lea ebx, [ebp-4]
		push ebx
		push eax
		call scanf
		add esp, 8
		popad

		;checking to see whether the input is 0 or -1
		mov eax, [ebp-4]
		cmp eax, 0
		je stopInputLoop
		cmp eax, -1
		je stopInputLoop

		;assign the char of the integer to the user's number
		lea edi, [ebp-48]
		mov ebx, ecx
		shl ebx, 2
		add edi, eax
		mov eax, [ebp-4]
		mov [edi], eax

		inc ecx
		jmp inputLoop

	stopInputLoop:
		pushad
		lea eax, [ebp-48]
		mov ecx, 10

		;print the prompt that looks for the search target
		pushad
		lea eax, prompt3
		push eax
		call printf
		add esp, 4
		popad

		;scan input number into a number
		pushad
		lea eax, formatSpecifier
		lea ebx, [ebp-4]
		push ebx
		push eax
		call scanf
		add esp, 8
		popad

		;push arguments for the search function 
		mov eax, [ebp-4]
		push eax
		lea eax, [ebp-48]
		push eax

		call search 
		mov [ebp-12], eax

		;compare the result w/ -1
		mov eax, [ebp-12]
		cmp eax, -1
		jne printFound

		;printing the not found message
		pushad
		lea eax, notFoundMessage
		push eax
		call printf
		add esp, 4
		popad
		jmp endMain

	printFound:
		pushad
		lea eax, foundMessage
		push [ebp-12]
		push eax
		call printf
		add esp, 8
		popad
		jmp endMain

	endMain:
		;function Epilouge
		mov esp, ebp
		pop ebp
		invoke ExitProcess, 0

	search:
		;function prologue
		push ebp
		mov ebp, esp

		push ecx
		push edx
		push eax

		;initalize the loop counter
		mov eax, 0

	searchLoop:
		;check if the array size > 10
		cmp eax, 10
		jge notFound

		;compare arr[i] w/ the search value
		mov ecx, [ebp+8]
		mov edx, [ebp+12]

		mov ebx, eax
		shl ebx, 2
		lea edi, [ecx+ebx]

		mov ebx, [edi]
		cmp ebx, edx
		je foundPrint

		inc eax
		jmp searchLoop

	foundPrint:
		mov eax, eax
		jmp searchEnd
	
	notFound:
		mov eax, -1
		jmp searchEnd

	searchEnd:
		;function epilogoue
		pop eax
		pop edx
		pop ecx

		mov esp, ebp
		pop ebp
		ret

main endp
end