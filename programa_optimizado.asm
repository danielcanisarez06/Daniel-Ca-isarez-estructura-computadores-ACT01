
.data
    vector_x: .word 1, 2, 3, 4, 5, 6, 7, 8
    vector_y: .space 32          # Espacio para 8 enteros (8 * 4 bytes)
    const_a:  .word 3
    const_b:  .word 5
    tamano:   .word 8

.text
.globl main

main:
    la   $s0, vector_x
    la   $s1, vector_y
    lw   $t0, const_a
    lw   $t1, const_b
    lw   $t2, tamano      # contador = tamaño

loop:
    beq  $t2, $zero, fin  # si contador == 0, salir

    lw   $t6, 0($s0)      # cargar X[i]

    addi $s0, $s0, 4      # avanzar puntero X
    addi $t2, $t2, -1     # decrementar contador

    mul  $t7, $t6, $t0    # multiplicación válida en MARS
    addu $t8, $t7, $t1    # suma con B

    sw   $t8, 0($s1)      # guardar resultado
    addi $s1, $s1, 4      # avanzar puntero Y

    j loop

fin:
    li $v0, 10
    syscall


