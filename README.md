##Purpose
The purpose of this R software is to provide an efficient way to cache a matrix and its inverse.
##Basic software Structure
The software contains two main functions:
 
-makeCacheMatrix

-cacheSolve

###Function makeCacheMatrix
The function makeCacheMatrix creates a cache to store a square matrix and its inverse. 
The input parameter is a square matrix. The default input is a 1X1 empty  matrix.
The function controls if the input parameter is a matrix and if it is a square matrix. 
If those conditions are not fulfilled, an error message is generated and the execution is terminated.  
The output is a list of callable functions that enable the storage and access of the matrices stored in the cache.
The following callable functions are provided in the list:

-get() retrieves the matrix stored in the cache
 
-set(x) stores a matrix x in the cache

-getInverse() fetches the inverse matrix in the cache, if any

-setInverse(y) stores the inverse matrix y in the cache
 
###Function cacheSolve
The function cacheSolve computes the inverse of the matrix stored in the cache. 
The input parameter is a cache object returned by the makeCacheMatrix (list of callable functions).
First, the function tries to fetch the inverse matrix stored in the cache. 
If there is an inverse matrix, it is returned and the execution is completed.
If there is no cached inverse matrix, the function gets the regular matrix in the cache
and it creates its inverse. The inverse is stored in the cache.
The inverse matrix is returned and the execution is terminated.
A basic assumption here is that the matrix stored in the cache can be inverted. 
Otherwise, the inversion operation fails and an error is generated.    
  