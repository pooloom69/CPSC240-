// ****************************************************************************************************************************
//  Project name: "Gnu Debugger".  
//  This program demonstrates how to make an assembly program that teaches all of the following:
//  This project develops a mixed-language program that integrates C/C++ functions with x86-64 assembly routines in order to 
//  create a workspace for GDB exploration. The program accepts an array of floating-point numbers from the user, 
//  computes their sum, sorts the values, and outputs the results.                                                          *
//  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//  version 3 as published by the Free Software Foundation.                                                                    *
//  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//  A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
// ****************************************************************************************************************************

//  Author Information:
//  Author name    : Sola Lhim
//  Author email   : pooloom069@csu.fullerton.edu
//  Author CWID    : 830259727 
// 
//  Program information
//  Program name: sort.c
//  Program languages: C86-64
//  Date Program began: 09/29/2025
//  Date of last update: //2025
// 		 
//  Purpose:
//  Sorts the float array in ascending order using selection sort algorithm
//  Important: Instead of swapping inline, it calls the assembly swap function.
// 
//  Project Information:
//  The primary purpose of this project is to provide a structured environment for learning and practicing the GNU Debugger (GDB). 
//  While previous assignments focused on building functional x86-64 assembly and C/C++ programs, 
//  this assignment emphasizes the debugging process—setting breakpoints, stepping through code, examining registers and memory, 
//  and observing program behavior at runtime. By reusing and extending earlier functions (such as inputarray, outputarray, and sum), 
//  students can focus on mastering GDB commands and techniques in the context of a working program.
// 
// 
//  Files: driver.c, manager.asm, input_array.asm, output_array.asm, sum.as, swap.asm, sort.c data.inc, r.sh
//  Language: C86-64
//  Status: The program has been tested extensively with no detectable errors.
// 
// 
// ===== Begin code area ====================================================================================================================================================
#include <stdio.h>

extern void swap(double *a, double *b);

// selection sort (find smallest to swap from unsorted part)
void sort(double arr[], long n){

    for(long i=0; i<n-1; i++){
        long min = i;

        for(long j=i+1; j<n; j++){
            if(arr[j]<arr[min]){
                min=j;
            }
        }
        if (min!=i){
        swap(&arr[i],&arr[min]);
        }
    }
}
