
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
   
	

###############################################################################
# End of your code.
###############################################################################
exit:
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.


