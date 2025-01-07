.text
.global _start
_start:
        mov r0, #1              // display text in stdout
        ldr r1, =message        // loading message into r1
        ldr r2, =len            // loading length of the message in r2
        mov r7, #4              // using SYS_WRITE with call number 4
        swi 0
        mov r7, #1              // sys call to exit the program
        swi 0



// this is the data segment to store the string and length
.data
message:
        .asciz "hello world\n"
len = .-message 
