# Assignment 2: Classify

## Part A: Mathematical Functions
In this assignment, most of our work involves completing the fill-in-the-blank sections in this part.
### Task1 : ReLU

### Task2 : ArgMax 
The functionality takes an input array and outputs the position of the maximum value. If there are multiple maximum values, it outputs the position of the first occurrence. The approach for this function is to use a loop to load each element, recording the value and position of the maximum. After the loop completes, it outputs the position of the maximum value.

### Task 3.1: Dot Product (dot)
The function takes two arrays as input and outputs the result of their dot product. The approach for this function is to use a loop to iterate through both arrays, multiplying the corresponding elements and summing the results. The main challenge encountered was in the multiplication step: it couldn’t use the standard positive-only multiplication method, as both positive and negative numbers needed to be supported. To address this, Booth's Algorithm was implemented to handle the addition in a way that allowed correct results for both positive and negative values.

### Task 3.2: Matrix Multiplication (matmul)

## Part B: File Operations and Main
### read_matrix : 
In read_matrix, the only modification is changing mul to a format compatible with RV32I. Here, the same method used in dot is applied.

### write_matrix : 
In write_matrix, the only modification is changing mul to a format compatible with RV32I. Here, the same method used in dot is applied.

### classify : 
In classify, the only modification is changing mul to a format compatible with RV32I. Here, the same method used in dot is applied.

### main : 
The main function calls classify to complete the entire MNIST digit recognition process.

## Others :
### abs : 
The functionality to take the absolute value of an input number is not used in the subsequent steps. The approach for this function is to first check if the number a is less than 0; if it is, use sub to change a to -a.
