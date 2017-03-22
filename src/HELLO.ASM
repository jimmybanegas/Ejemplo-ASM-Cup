
format PE CONSOLE 4.0
entry start

include 'win32a.inc'

section '.data' data readable writeable

       str_pause db  'pause' ,0
       temp1 dd 0
       temp2 dd 0
       temp3 dd 0
       temp4 dd 0
       temp5 dd 0
       temp6 dd 0
       @A@ dd 0
       @B@ dd 0
       @eax@ dd 0
       @intprintstr db 'Resultado: %d' ,10,0


section '.code' code readable executable

  start:
      mov eax,1
      add eax,7
      mov [temp1],eax
      mov eax,[temp1]
      add eax,5
      mov [temp2],eax
      mov eax,[temp2]
      mov [@A@],eax
      mov eax,2
      add eax,3
      mov [temp3],eax
      mov eax,[temp3]
      add eax,4
      mov [temp4],eax
      mov eax,[temp4]
      mov [@B@],eax
      mov eax,[@A@]
      add eax,[@B@]
      mov [temp5],eax
      mov eax,[temp5]
      add eax,[@A@]
      mov [temp6],eax
      mov eax,[temp6]
      mov [@eax@],eax
      push [@eax@]
      push @intprintstr
      call [printf]
      add esp,8

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
