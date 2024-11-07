.globl relu

.text
# ==============================================================================
# FUNCTION: Array ReLU Activation
#
# Applies ReLU (Rectified Linear Unit) operation in-place:
# For each element x in array: x = max(0, x)
#
# Arguments:
#   a0: Pointer to integer array to be modified
#   a1: Number of elements in array
#
# Returns:
#   None - Original array is modified directly
#
# Validation:
#   Requires non-empty array (length ≥ 1)
#   Terminates (code 36) if validation fails
#
# Example:
#   Input:  [-2, 0, 3, -1, 5]
#   Result: [ 0, 0, 3,  0, 5]
# ==============================================================================
relu:
    li t0, 1             
    blt a1, t0, error     
    li t1, 0             

loop_start:
    # TODO: Add your own implementation
    beq t1, a1, loop_end        # for t1 from 0 to a1-1           
    slli t4, t1, 2              # t4 = t1 * sizeof(int)
    add t2, t4, a0              # t2 = a0 + t1 * sizeof(int)
    lw t3, 0(t2)                # t3 = a0[t2]
    bge t3, x0, loop_continue   # if t3 > 0, jump to loop_continue
    add t3, x0, x0              # t3 = 0
    sw t3, 0(t2)                # a0[t2] = t3
 loop_continue:
    addi t1, t1, 1              # t1 = t1 + 1
    j loop_start

loop_end:
    # Epilogue  
    ret   
    
error:
    li a0, 36          
    j exit          
