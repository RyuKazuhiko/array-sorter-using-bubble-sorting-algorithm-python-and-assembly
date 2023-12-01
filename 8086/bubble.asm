dosseg
.model small
.stack 100h
.data
    arrM db "Array : $"       ; Message to display array
    arr  db 7,8,4,1,2,3,9,5,0,6   ; Initial array data
    space db ' '              ; Space character for separation
.code
main proc
    mov  ax ,@data            ; Load data segment address to AX
    mov  ds , ax              ; Set data segment to the loaded address
    call displayArr           ; Call the displayArr procedure to show the initial array
    mov  bx , 9               ; Outer loop counter (index starts from 0)

outerLoop:  
    lea  si , arr             ; Load address of arr into SI (index register)
    push bx                   ; Preserve outer loop counter
    mov  cx , bx              ; Inner loop counter

innerLoop:  
    mov  al , [si]            ; Load byte from memory location pointed by SI into AL
    mov  dl , [si+1]          ; Load next byte from memory location pointed by SI+1 into DL
    cmp  al , dl              ; Compare AL and DL
    jl   next                 ; If AL < DL, skip swap
    mov  [si] , dl            ; Swap elements in memory
    mov  [si+1] ,al
next:       
    inc  si                   ; Increment SI (move to next element)
    loop innerLoop            ; Repeat inner loop for the counter CX
    pop  bx                   ; Restore outer loop counter
    dec  bx                   ; Decrement outer loop counter
    jnz outerLoop             ; Jump to outerLoop if outer loop counter is not zero

    call displayArr           ; Call displayArr to show the sorted array
    mov  ah , 4ch             ; DOS function to exit program
    int  21h                  ; Call DOS interrupt

displayArr proc
    lea  dx , arrM            ; Load address of arrM into DX (pointer to display message)
    mov  ah , 9               ; DOS function to display string
    int  21h                  ; Call DOS interrupt

    lea  si , arr             ; Load address of arr into SI (index register)
    mov  cx , 10              ; Loop counter to display all 10 elements

displayLoop:
    mov  dl ,[si]             ; Load byte from memory location pointed by SI into DL
    add  dl , 48              ; ASCII Adjustment to convert to ASCII character
    mov  ah , 2               ; DOS function to display character
    int  21h                  ; Call DOS interrupt
    mov  dl, space            ; Display a space after each element
    int  21h                  ; Call DOS interrupt
    inc  si                   ; Move to next element in the array
    loop displayLoop          ; Repeat until loop counter CX becomes zero

    mov  dl , 10              ; New line character
    mov  ah , 2               ; DOS function to display character
    int  21h                  ; Call DOS interrupt
    
    ret                       ; Return from procedure
displayArr endp
main endp
end main