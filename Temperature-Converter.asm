include emu8086.inc 

org 100h
.data 
 
input1  dw " Enter the Temperature in Celsius: ",'$'
output1 dw " The Temperature in Fahrenheit: ",'$'

input2  dw " Enter the Temperature in Fahrenheit: ",'$'
output2 dw " The Temperature in Celsius: ",'$'

input3  dw " Enter the Temperature in Celsius: ",'$'
output3 dw " The Temperature in Kelvin : ",'$'

input4  dw " Enter the Temperature in Fahrenheit: ",'$'
output4 dw " The Temperature in Kelvin : ",'$'

input5  dw " Enter the Temperature in Kelvin: ",'$'
output5 dw " The Temperature in Celsius: ",'$'

input6  dw " Enter the Temperature in Kelvin: ",'$'
output6 dw " The Temperature in Fahrenheit: ",'$'     

text1   dw " Welcome to Temperature Converter Menu",'$'
text2   dw " 1.Celsius to Fahrenheit",'$'
text3   dw " 2.Fahrenheit to Celsius",'$'
text4   dw " 3.Celsius to Kelvin",'$'
text5   dw " 4.Fahrenheit to Kelvin",'$'  
text6   dw " 5.Kelvin to Celcius",'$'
text7   dw " 6.Kelvin to Fahrenheit",'$'
text8   dw " 7.Exit",'$'
text9   dw " Select the number between 1 and 7: ",'$'
menu    dw " Do you want to go back to menu (Enter 1 for Menu or 0 for Exit): ",'$' 

error   dw " Invalid Input! Plz Enter the Correct Input",'$'

exit    dw " The Program Terminated Sucessfully!",'$'      

linebreak dw 10,13,'$'

g dw 0
a dw 0    



.code
main proc 
    
start:

mov ax,@data
mov ds,ax
mov dx,offset text1
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset text2
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset text3
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset text4
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset text5
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h
 
mov ax,@data
mov ds,ax
mov dx,offset text6
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset text7
mov ah,9
int 21h
       
mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset text8
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset text9
mov ah,9
int 21h



call scan_num 
mov a,cx      

cmp a,1 
je Celsius_converter 

cmp a,2
je Fahrenheit_converter

cmp a,3
je Celsius_to_Kelvin_converter

cmp a,4
je Fahrenheit_to_kelvin_converter        
        
cmp a,5
je Kelvin_to_Celsius_converter

cmp a,6
je Kelvin_to_Fahrenheit_converter

cmp a,7
je exit_program 

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset error
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

jmp start

Celsius_converter:

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset input1
mov ah,9
int 21h

call scan_num
mov g,cx

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset output1
mov ah,9
int 21h 

mov ax,g
mov bx,9
mul bx
mov bx,5
div bx
mov bx,32
add ax,bx
 
call print_num 

exit1: 
 
mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset menu
mov ah,9
int 21h

call scan_num
mov a,cx

cmp a,1

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

je start

cmp a,0 
je exit_program

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset error
mov ah,9
int 21h

jmp exit1              

Fahrenheit_converter:

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset input2
mov ah,9
int 21h

call scan_num
mov g,cx 

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset output2
mov ah,9
int 21h 

mov ax,g
mov bx,32
sub ax,bx
mov bx,5
mul bx
mov bx,9
cwd 

idiv bx  

call print_num

exit2: 
 
mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset menu
mov ah,9
int 21h

call scan_num
mov a,cx

cmp a,1

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

je start

cmp a,0 
je exit_program

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset error
mov ah,9
int 21h

jmp exit2

Celsius_to_Kelvin_converter:

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset input3
mov ah,9
int 21h

call scan_num
mov g,cx 

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset output3
mov ah,9
int 21h

mov ax,g
mov bx,273
add ax,bx

call print_num

exit3: 
 
mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset menu
mov ah,9
int 21h

call scan_num
mov a,cx

cmp a,1

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

je start

cmp a,0 
je exit_program

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset error
mov ah,9
int 21h

jmp exit3

Fahrenheit_to_kelvin_converter:

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset input4
mov ah,9
int 21h

call scan_num
mov g,cx 

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset output4
mov ah,9
int 21h

mov ax,g
mov bx,32
sub ax,bx
mov bx,5                    
mul bx
mov bx,9
cwd ;Sign-extend AX into DX:AX for signed division
idiv bx
mov bx,273
add ax,bx

call print_num

exit4: 
 
mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset menu
mov ah,9
int 21h

call scan_num
mov a,cx

cmp a,1

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

je start

cmp a,0
je exit_program

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset error
mov ah,9
int 21h

jmp exit4  

Kelvin_to_Celsius_converter:
    mov ax, @data
    mov ds, ax
    mov dx, offset linebreak
    mov ah, 9
    int 21h

    mov ax, @data
    mov ds, ax
    mov dx, offset input5
    mov ah, 9
    int 21h

    call scan_num
    mov g, cx

    mov ax, @data
    mov ds, ax 
    mov dx, offset linebreak
    mov ah, 9
    int 21h

    mov ax, @data
    mov ds, ax
    mov dx, offset output5
    mov ah, 9
    int 21h

    mov ax, g
    mov bx,273
    sub ax,bx 

    call print_num

    
    
           
exit5: 
mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset menu
mov ah,9
int 21h

call scan_num
mov a,cx

cmp a,1

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

je start

cmp a,0 
je exit_program

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset error
mov ah,9
int 21h

jmp exit5
;je start

;cmp a,0
;je exit_program

;mov ax,@data
;mov ds,ax
;mov dx,offset linebreak
;mov ah,9
;int 21h

;mov ax,@data
;mov ds,ax
;mov dx,offset error
;mov ah,9
;int 21h

;jmp exit4 

Kelvin_to_Fahrenheit_converter:
    
    
    
    mov dx, offset linebreak
    mov ah, 9
    int 21h

    mov ax, @data
    mov ds, ax
    mov dx, offset input6
    mov ah, 9
    int 21h

    call scan_num
    mov g, cx

    mov ax, @data
    mov ds, ax 
    mov dx, offset linebreak
    mov ah, 9
    int 21h

    mov ax, @data
    mov ds, ax
    mov dx, offset output6
    mov ah, 9
    int 21h


    mov ax, g
    mov bx,273
    sub ax,bx 
    mov bx, 9
    mul bx
    mov bx, 5
    cwd
    idiv bx
    mov bx, 32
    add ax, bx     
    
    call print_num
    mov ax, @data
    mov ds, ax 
    mov dx, offset linebreak
    mov ah, 9
    int 21h
    
exit6:
mov ax,@data
mov ds,ax
mov dx,offset menu
mov ah,9
int 21h

call scan_num
mov a,cx

cmp a,1

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

je start

cmp a,0 
je exit_program

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h

mov ax,@data
mov ds,ax
mov dx,offset error
mov ah,9
int 21h

jmp exit6
exit_program:

mov ax,@data
mov ds,ax
mov dx,offset linebreak
mov ah,9
int 21h 

mov ax,@data
mov ds,ax
mov dx,offset exit
mov ah,9
int 21h

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM 
END 

main endp
end proc