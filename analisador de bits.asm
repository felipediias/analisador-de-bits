#declarando mensagens do codigo no caso os prints
.data
n1: .asciiz "Digite n1: \n"
eh_par: .asciiz "É par\n"
eh_impar: .asciiz "É impar\n"
bit_on: .asciiz "5º bit ON\n"
bit_off: .asciiz "5º bit OFF\n"

.text
.globl main
main:
    #print da frase de n1 e quardando a frase em $a0
    li $v0 , 4 
    la $a0 , n1
    syscall

    li $v0 , 5 #leitura do n1 
    syscall
    move $t0, $v0 #valor de n1 guardado em $t0

    #status do 5º bit
    li $t1, 32  
    and $t3, $t0, $t1  # $t3 = número AND máscara
    beq $t3, $zero, bit_off_lbl  # se t3 == 0 vai para bit_off_lbl

    #senão print bit_on
    li $v0 , 4
    la $a0, bit_on
    syscall
    j fim

bit_off_lbl: #5º bit desligado
    li $v0 ,4
    la $a0, bit_off   # imprime a string do .data
    syscall
    j fim

#criar a mascara de bit e verificar se é par ou impar
li $t1, 1 
and $t2 , $t0, $t1 
beq $t2, $zero, par #vai para é par se for 0

#senão for par
li $v0 , 4
la $a0, eh_impar 
syscall
j fim

par:
    li $v0, 4
    la $a0, eh_par
    syscall

#finalizar programa
fim:
    li $v0, 10  # syscall para finalizar
    syscall