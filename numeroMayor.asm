.data
    mensaje: .asciiz "Ingrese un número: "
    resultado: .asciiz "El número mayor es: "

.text
.globl main
main:
    li $v0, 4
    la $a0, mensaje
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, mensaje
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, mensaje
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    bgt $t0, $t1, check_t2
    move $t0, $t1

check_t2:
    bgt $t0, $t2, print_result
    move $t0, $t1
    
compare_t2:
    bgt $t0, $t2, print_result
    move $t0, $t2

print_result:
    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall