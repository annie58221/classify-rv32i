.globl dot

.text
# =======================================================
# FUNCTION: Strided Dot Product Calculator
#
# Calculates sum(arr0[i * stride0] * arr1[i * stride1])
# where i ranges from 0 to (element_count - 1)
#
# Args:
#   a0 (int *): Pointer to first input array
#   a1 (int *): Pointer to second input array
#   a2 (int):   Number of elements to process
#   a3 (int):   Skip distance in first array
#   a4 (int):   Skip distance in second array
#
# Returns:
#   a0 (int):   Resulting dot product value
#
# Preconditions:
#   - Element count must be positive (>= 1)
#   - Both strides must be positive (>= 1)
#
# Error Handling:
#   - Exits with code 36 if element count < 1
#   - Exits with code 37 if any stride < 1
# =======================================================
dot:
    li t0, 1
    blt a2, t0, error_terminate  
    blt a3, t0, error_terminate   
    blt a4, t0, error_terminate  

    li t0, 0            
    li t1, 0               # counter
    addi t2, x0, 2         # add
    sll a3, a3, t2         # add
    sll a4, a4, t2         # add

loop_start:
    bge t1, a2, loop_end
    # TODO: Add your own implementation
    
    mv t3, t1                # mul t2, t1, a3
    mv t6, a3  
    li t4, 0
    li t5, 32
    li t2, 0  
loop:
    bge t4, t5, end_loop
    addi t4, t4, 1
    andi a7, t6, 1
    srli t6, t6, 1
    bnez a7, add_to_result
    slli t3, t3, 1
    j loop
add_to_result:
    add t2, t2, t3
    slli t3, t3, 1
    j loop
end_loop:

    mv a6, t1             # mul t3, t1, a4
    mv t6, a4   
    li t4, 0
    li t5, 32
    li t3, 0   
loop_2:
    bge t4, t5, end_loop_2
    addi t4, t4, 1
    andi a7, t6, 1
    srli t6, t6, 1
    bnez a7, add_to_result_2
    slli a6, a6, 1
    j loop_2
add_to_result_2:
    add t3, t3, a6
    slli a6, a6, 1
    j loop_2
end_loop_2:    

    
    add t2, a0, t2           # t4 = array0 + counter * stride0 * sizeof(int)
    add t3, a1, t3           # t5 = array1 + counter * stride1 * sizeof(int)
    lw t2, 0(t2)             # t4 = array0[counter]
    lw t3, 0(t3)             # t5 = array1[counter]
        
    mv a6, t2                # mul t4, t2, t3
    mv t6, t3   
    li t2, 0
    li t5, 32
    li t4, 0   
loop_3:
    bge t2, t5, end_loop_3
    addi t2, t2, 1
    andi a7, t6, 1
    srli t6, t6, 1
    bnez a7, add_to_result_3
    slli a6, a6, 1
    j loop_3

add_to_result_3:
    add t4, t4, a6
    slli a6, a6, 1
    j loop_3
end_loop_3:     
    add t0, t0, t4           # product = product + array0[counter] * array[counter]
    addi t1, t1, 1           # counter = counter + 1
    j loop_start
    
    
    
loop_end:
    mv a0, t0
    jr ra

error_terminate:
    blt a2, t0, set_error_36
    li a0, 37
    j exit

set_error_36:
    li a0, 36
    j exit
