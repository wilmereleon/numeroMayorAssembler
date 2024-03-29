.data
    mensaje: .asciiz "Ingrese un número: "
    resultado: .asciiz "El número mayor es: "

.text
.globl main
main:
    # Pedir el número al usuario
    li $v0, 4
    la $a0, mensaje
    syscall

    # leer el número del usuario
    li $v0, 5
    syscall
    move $t0, $v0

    # Pedir el número al usuario (segunda vez)
    li $v0, 4
    la $a0, mensaje
    syscall

    #Lee le número del usuario
    li $v0, 5
    syscall
    move $t1, $v0

    # Pedir el número al usuario (tercera vez)
    li $v0, 4
    la $a0, mensaje
    syscall

    #Lee le número del usuario
    li $v0, 5
    syscall
    move $t2, $v0
    
    #Se cotejan los tres números...
    # ...(con el método de «chech_t2», para garantizar que los tres números queden comparados y cotejados)
    bgt $t0, $t1, check_t2
    move $t0, $t1

   
check_t2:
    bgt $t0, $t2, print_result
    move $t0, $t1
    
    #Se comparan los primeros dos números ingresados
compare_t2:
    bgt $t0, $t2, print_result
    move $t0, $t2

   #Se imprime el resultado
print_result:
    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall
