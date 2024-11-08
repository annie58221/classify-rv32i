# Assignment 2: Classify

## Part A: Mathematical Functions
In this assignment, most of our work involves completing the fill-in-the-blank sections in this part.
### Task1 : ReLU
The function of ReLU is to output 0 if a number is less than or equal to 0, and to output the original value if it is greater than 0. In this function, the input is an array, and the output is the result of applying ReLU to each element in the array, storing this result back into the original array. In assembly language, a0 is a pointer to the integer array, and a1 is the number of elements in the array. If the number of elements in the array is less than 0, an error will be raised. The approach for this function is to use a loop from 0 to a1 - 1 (ensuring all elements in the array are evaluated). For each element, if the number is greater than or equal to 0, it is retained; if it is less than 0, the number is set to 0 and stored back in the original array.

### Task2 : ArgMax 
The functionality takes an input array and outputs the position of the maximum value. If there are multiple maximum values, it outputs the position of the first occurrence. The approach for this function is to use a loop to load each element, recording the value and position of the maximum. After the loop completes, it outputs the position of the maximum value.

### Task 3.1: Dot Product (dot)
The function takes two arrays as input and outputs the result of their dot product. The approach for this function is to use a loop to iterate through both arrays, multiplying the corresponding elements and summing the results. The main challenge encountered was in the multiplication step: it couldn’t use the standard positive-only multiplication method, as both positive and negative numbers needed to be supported.

### Task 3.2: Matrix Multiplication (matmul)
This function only completes the inner_loop_end and outer_loop_end sections. In the inner_loop section, it simply increments the outer_loop counter (s8) by one and jumps to outer_loop_start. In the outer_loop_end section, it restores all registers.

## Part B: File Operations and Main
In this section, most of the code is already completed and only requires minor modifications.

### Task 1: Read Matrix (read_matrix) 
In read_matrix, the only modification is changing mul to a format compatible with RV32I. Here, the same method used in dot is applied.

### Task 2: Write Matrix (write_matrix)
In write_matrix, the only modification is changing mul to a format compatible with RV32I. Here, the same method used in dot is applied.

### Task 3: Classification (classify) 
In classify, the only modification is changing mul to a format compatible with RV32I. Here, the same method used in dot is applied.

## Others :
### main : 
The main function calls classify to complete the entire MNIST digit recognition process.

### abs : 
The functionality to take the absolute value of an input number is not used in the subsequent steps. The approach for this function is to first check if the number a is less than 0; if it is, use sub to change a to -a.
