.section .data
buffer:  .space 100              @ Reserve 100 bytes for the input buffer
msg:     .asciz "Printing: "     @ Message to display before the input

.section .text
.global _start

_start:
    @ Read user input
    mov r7, #3                   @ syscall: sys_read
    mov r0, #0                   @ file descriptor 0 (stdin)
    ldr r1, =buffer              @ address of the buffer
    mov r2, #100                 @ max number of bytes to read
    svc #0                       @ make syscall
    mov r3, r0                   @ save number of bytes read in r3

    @ Print the message "Printing: "
    mov r7, #4                   @ syscall: sys_write
    mov r0, #1                   @ file descriptor 1 (stdout)
    ldr r1, =msg                 @ address of the message
    mov r2, #10                  @ length of the message
    svc #0                       @ make syscall

    @ Print the user input
    mov r7, #4                   @ syscall: sys_write
    mov r0, #1                   @ file descriptor 1 (stdout)
    ldr r1, =buffer              @ address of the buffer
    mov r2, r3                   @ number of bytes read (stored in r3)
    svc #0                       @ make syscall

    @ Exit the program
    mov r7, #1                   @ syscall: sys_exit
    mov r0, #0                   @ exit code 0
    svc #0                       @ make syscall

