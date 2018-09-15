;the sub-directories
.model small
.stack
.data   

path db "*.*",0 ; ten file
DTA db 128 dup(?) ; buffer luu tru DTA

.code
mov ax,@data ; 
mov ds,ax ; data segment
mov es,ax ; ax -> es
mov dx,OFFSET DTA ; DS:DX tro toi DTA
mov ah,1AH ; function 1Ah - set DTA
int 21h   

mov cx,3Fh ; lop thuoc tinh-tat ca cac file
mov dx,OFFSET path ; DS:DX ASCII filename
mov ah,4Eh ;  4Eh  tim truoc
int 21h 

LoopCycle:
mov dx,OFFSET path ; DS:DX tro ten file
mov ah,4Fh ; ham 4fh- tim tiep
int 21h 

jc exit  

mov cx,13 ; do dai ten file
mov si,OFFSET DTA+30 ; DS:SI tro toi ten file trong DTA
xor bh,bh ; video page - 0
mov ah,0Eh ; 0Eh - viet ra ki tu
NextChar:
lodsb ; AL = ky tu tiep theo trong chuoi
int 10h ; 
loop NextChar    

mov di,OFFSET DTA+30 ; ES:DI tro toi DTA
mov cx,13 ; do dai ten file
xor al,al ; fill with zeros
rep stosb ; lam rong DTA
jmp LoopCycle ; tiep tuc tim kiem

exit:
mov ax,4C00h ; exit to DOS
int 21h
end