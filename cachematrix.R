##Two functions:
##1)makeCacheMatrix 
##2)cacheSolve

#makeCacheMatrix function has a matrix as input and it performs:
#Checks if the input is a square matrix
#stores the matrix in the matrix cache
#create methods to set and get the matrix
#create methods to set and get the inverse of the matrix
#Output is a list of callable functions supported. 

makeCacheMatrix <- function(x = matrix()){
  
  #function to check if a parameter is a square matrix
  checkIn <- function(mat){
    res <- TRUE
    if (class(mat) != "matrix") {
      message("No new object created. Input must be a MATRIX")
      res<- FALSE
    }else if (dim(mat)[1] != dim(mat)[2]){
      message("No new object created. Input must be a SQUARE MATRIX")
      res <- FALSE
    }
    res
  }
  
  #invoke the function to check if the input is a valid input matrix
  if (checkIn(x) == FALSE) return() #return if invalid input
  
  #Valid input
  invMat <- NULL #Inverse Cache is cleared
  
  # function to store a new matrix
  set <- function(newMat){
    #check if the input is a valid matrix
    if (checkIn(newMat) == FALSE) return()#return if not valid
    #else
    x <<- newMat    #Store new matrix in cache
    invMat <<- NULL #clear old inverse cache
  }
  
  #function to get the cached matrix
  get <- function() {
    x         #return the cached matrix
  }
  
  #function to store an inverse matrix 
  setInverse <- function(inv){
    if (checkIn(inv) == FALSE) return()
    invMat <<- inv #store valid input in cache
  } 
  
  #function to get the inverse matrix
  getInverse <- function() {
    invMat     #return the inverse
  }
  #return a list of callables 
  list(set=set, get=get, setInverse=setInverse,getInverse=getInverse)
}

#The cacheSolve function receives a cache object as input.
#First it tries to fetch the inverse matrix in the cache object.
#If the inverse matrix is available, it returns the inverse matrix
#Otherwise, it gets the matrix in the cache object and it calculates the inverse.
#The new inverse  is stored in the cache object.
#The new inverse is returned. 

cacheSolve <- function(Xmat,...){
  invMat <- Xmat$getInv()
  if (!is.null(invMat)){ 
    message("Inverse Matrix in cache returned")
    return(invMat)
  }
  
  mat <- Xmat$get()    #get the existing matrix in the cache
  invMat <- solve(mat) # calculate the inverse 
  Xmat$setInv(invMat)  #store the new inverse in the cache
  invMat               #return the new inverse
}