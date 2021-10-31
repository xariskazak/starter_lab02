
# lab02.asm - Pairwise swap in an array of 32bit integers
#   coded in  MIPS assembly using MARS
#Β for MYΞ₯-505 - Computer Architecture, Fall 2021
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
   	add	$s4,$a0,$t5#Το $s4 ειναι η διευθυνση 1ου στοιχειου του 2ου μισου του πινακα
loop:
	add	$a3,$a0,$t0#Το $a3 ειναι η νεα διευθυνση
	beq	$a3, $s4, exit# Αν $a3 ειναι ισο με $s4 τοτε ετικετα exit αλλιως συνεχισε την επομενη εντολη
	lw	$s3,0($a3)#Το $s3 περιεχομενο της νεας διευθυνσης $a3
	
	add     $a2,$s4,$t1 #Το $a2 ειναι η νεα διευθυνση για το 2ο μισο του πινακα 
	lw 	$s2,0($a2)#Το $s2 περιεχομενο της νεας διευθυνσης $a2 δηλαδη του 2ου μισου του πινακα
	
 	sw	$s3,0($a2)#Στην νεα διεθυνση του 2ου μισου του πινακα βαζω το $s3
 	sw	$s2,0($a3)#Στην νεα διεθυνση του 1ου μισου του πινακα βαζω το $s2
 	
 	addi	$t0,$t0,4 #Αυξανω την μεταβλητη $t0 για να εμφανιστει επομενο στοιχειο του πινακα
 	addi	$t1,$t1,4 #Αυξανω την μεταβλητη $t για να εμφανιστει επομενο στοιχειο του πινακα
 	
 	j loop
 	
 	
	

###############################################################################
# End of your code.
###############################################################################
exit:
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.


