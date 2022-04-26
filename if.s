/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA
* Fabian Estuardo Juarez Tello 21440
* Sara Maria Perez Echeverria 21371
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
* If
 ----------------------------------------------- */

  @@ codigo de assembler: se coloca en la seccion .text
.text
.align 2
  @@ etiqueta "main" llama a la funcion global
.global main
.type main, %function

main:
@@ grabar registro de enlace en la pila
    stmfd sp!,{lr}

    @ingreso
    ldr r0,=ingreso
	bl puts
	ldr r0,=entrada
	ldr r1,=max
	bl scanf

    @guardar valor
    ldr r6,=bandera
    ldr r7,=max
    ldr r6,[r6]
    ldr r7,[r7]
    cmp r7, #61
    addle r6, #1
    addgt r6, #2
    ldr r0,=output
    mov r1,r6
    bl printf
    mov r0, #0
    mov r3, #0
    ldmfd sp!, {lr}
    bx lr
.data
.align 2

max: .word 0
bandera: .word 0

entrada: .asciz " %d"
ingreso: .asciz "Su nota maxima obtenida en los examenes cortos es: "
output: .asciz "La valoracion de la bandera es: %d\n "