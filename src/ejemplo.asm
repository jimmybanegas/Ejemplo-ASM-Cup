format PE CONSOLE 4.0
entry start

include 'win32a.inc'

section '.data' data readable writeable

       str_pause db  'pause' ,0
        @intprintstr db 'Resultado: %d' ,10,0
     @intscanstr db '%d',0
		temp4 dd 0
		temp3 dd 0
		temp2 dd 0
		temp1 dd 0
		@a@ dd 0
		@b@ dd 0
		@c@ dd 0
		@d@ dd 0
		@e@ dd 0
		@x@ db 0


section '.code' code readable executable

  start: 
		mov eax,1
		add eax,3
		mov [temp1],eax
		mov eax,[temp1]
		mov [@e@],eax
		
		mov eax,0
		mov [@a@],eax
		
		mov eax,5
		mov [@b@],eax
		
		while1:
		mov eax,[@b@]
		cmp [@a@], eax
		jle while_body1
		jmp end_while1
		
		while_body1:
		push [@a@]
		push @intprintstr
		call [printf]
		add esp,8
		mov eax,[@a@]
		add eax,1
		mov [temp2],eax
		mov eax,[temp2]
		mov [@a@],eax
		jmp while1
		
		end_while1:
		
		mov eax,100
		mov ecx,2
		div ecx
		mov [temp3],eax
		mov eax,[temp3]
		mov [@c@],eax
		
		mov eax,50
		cmp [@c@], eax
		je if1
		jmp end_if1
		
		if1:
		mov eax,[@c@]
		mov ebx,2
		mul ebx
		mov [temp4],eax
		push [temp4]
		push @intprintstr
		call [printf]
		add esp,8
		
		end_if1:
		
		mov eax,0
		mov [@d@],eax
		
		for1:
		mov eax, 2
		cmp [@d@], eax
		jge end_for1
		push @a@
		push @intscanstr
		call [scanf]
		add esp, 8
		push [@a@]
		push @intprintstr
		call [printf]
		add esp,8
		inc [@d@]
		jmp for1
		
		end_for1:
    
;Finalizar el proceso
      push str_pause
      call [system]
      add esp, 4
      call [ExitProcess]   

section '.idata' import data readable writeable

  library kernel,'KERNEL32.DLL',\
          ms ,'msvcrt.dll'

  import kernel,\
         ExitProcess,'ExitProcess'

  import ms,\
         printf,'printf',\
         cget ,'_getch',\
         system,'system',\
         scanf,'scanf'
                          