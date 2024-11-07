.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error

    lw t0, 0(a0)
    li t1, 0                    #counter
    li t2, 1
    li t5, 0         # add
loop_start:
    # TODO: Add your own implementation
    beq t1, a1, loop_end        # for t1 from 0 to a1-1 
    slli t2, t1, 2
    
    add t2, t2, a0              # t2 = a0 + t1 * sizeof(int)
    lw t3, 0(t2)                # t3 = a0[t1]
    ble t3, t0, loop_continue   # if a0[t0] <= max, jump to loop_continue
    mv t0, t3                   # max = a0[t0]
    mv t5, t1                   # index = t1

loop_continue:
    addi t1, t1, 1
    j loop_start

loop_end:
    mv a0, t5                   # return index    
    # Epilogue
    ret
    
handle_error:
    li a0, 36
    j exit
