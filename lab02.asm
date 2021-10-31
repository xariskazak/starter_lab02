
# lab02.asm - Pairwise swap in an array of 32bit integers
#   coded in  MIPS assembly using MARS
# for MYΥ-505 - Computer Architecture, Fall 2021
# Department of Computer Science and Engineering, University of Ioannina
# Instructor: Aris Efthymiou

        .globl swapArray # declare the label as global for munit
        
###############################################################################
        .data
array: .word 5, 6, 7, 8, 1, 2, 3, 4

###############################################################################
        .text 
# label main freq. breaks munit, so it is removed...
        la         $a0, array
        li         $a1, 8


swapArray:
###############################################################################
# Write you code here.
# Any code above the label swapArray is not executed by the tester! 
###############################################################################
      	add 	$t0, $zero, $zero# $t0=0
      		
      	add 	$t1,$zero,$zero	# $t1= 0
   	srl	$t4,$a1,1 #$t4= size/2
   	sll	$t5,$t4,2 #$t5*4
   	add	$s4,$a0,$t5#�� $s4 ����� � ��������� 1�� ��������� ��� 2�� ����� ��� ������
loop:
	add	$a3,$a0,$t0#�� $a3 ����� � ��� ���������
	beq	$a3, $s4, exit# �� $a3 ����� ��� �� $s4 ���� ������� exit ������ �������� ��� ������� ������
	lw	$s3,0($a3)#�� $s3 ����������� ��� ���� ���������� $a3
	
	add     $a2,$s4,$t1 #�� $a2 ����� � ��� ��������� ��� �� 2� ���� ��� ������ 
	lw 	$s2,0($a2)#�� $s2 ����������� ��� ���� ���������� $a2 ������ ��� 2�� ����� ��� ������
	
 	sw	$s3,0($a2)#���� ��� �������� ��� 2�� ����� ��� ������ ���� �� $s3
 	sw	$s2,0($a3)#���� ��� �������� ��� 1�� ����� ��� ������ ���� �� $s2
 	
 	addi	$t0,$t0,4 #������ ��� ��������� $t0 ��� �� ���������� ������� �������� ��� ������
 	addi	$t1,$t1,4 #������ ��� ��������� $t ��� �� ���������� ������� �������� ��� ������
 	
 	j loop
 	
 	
	

###############################################################################
# End of your code.
###############################################################################
exit:
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.


