/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA
* Fabian Estuardo Juarez Tello 21440
* Sara Maria Perez Echeverria 21371
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
*
* Ejercicio 1b .s
* Crear un ciclo con un contador igual a 10
*  multiplicar veces por 2 cuando este sea mayor que 0
*  imprime la cantidad de veces que sera calculada
 ----------------------------------------------- */

	@@ codigo de assembler: se coloca en la seccion .text
	.text
	.align		2
	@@ etiqueta "main" llama a la funcion global
	.global		main
	.type		main, %function
main:
	@@ grabar registro de enlace en la pila
	stmfd	sp!, {lr}
	@ciclo for
    mov r10,#10 /*contador*/
    cicloF:
	@carga valores
    ldr r6, =a
    ldr r8,[r6]
	ldr r9, =b
	ldr r11,[r9]
	@resta a contador
    sub r10,#1
	@multiplicacion por 2
    mul r8,r11
    @guarda valor y regresa
	mov r8,r8
	str r8,[r6]
	@compara si el contador es igual a 0 o menor
    cmp r10,#0
    bne cicloF
	b fin

fin:
	@guarda valor y regresa
	mov r8,r8
	str r8,[r6]
    ldr r0,=Lmessage
    ldr r1,=a
    ldr r1,[r1]
    bl printf
    @@ r0, r3 <- 0 como sennal de no error al sistema operativo
	mov	r3, #0
	mov	r0, r3

	@ colocar registro de enlace para desactivar la pila y retorna al SO
	ldmfd	sp!, {lr}
	bx	lr
.data
.align 2

a:	.word 1
b:	.word 2

Lmessage:
	.asciz "El valor resultante es --> %d\n"
entrada:
	.asciz " %d"
