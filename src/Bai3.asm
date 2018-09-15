CODE            SEGMENT

                ASSUME  CS:CODE

                PUSH    CS             
                POP     ES             

                MOV     AX,0201H        ; READ - 1 sector
                MOV     BX,OFFSET Buffer; Point BX to buffer
                MOV     CX,0001H        ; Cylinder 0, Sector 1
                MOV     DX,0080H        ; Head 0, Drive 80H
                INT     13H             

                MOV     AX,4C00H        
                INT     21H

Buffer          DB      512 DUP (?)     

CODE            ENDS

                END