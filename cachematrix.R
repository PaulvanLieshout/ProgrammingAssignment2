## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function 
# PvL 26/04/14 - non square matrices do not have an inverse matrix
# as such the required matrix has to be a 'square matrix'
# as such input to makeCacheMatrix can be matrix(1:9,3) without nrow and ncol
# using this to change example in following - runs ok
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL  
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
a <-makeCacheMatrix(matrix(1:4,2)) # the following lines have been used for testing
a
a$get()
a$set(matrix(1:9,3)) # change data and dim of matrix
a$get()

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

