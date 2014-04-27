## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function 
# PvL 26/04/14 - non square matrices do not have an inverse matrix
# as such the required matrix has to be a 'square matrix'
# is also has to be an invertable matrix
# 3x3 matrix used below is an invertable matrix used for testing

##following function stores a matrix in the cashe (using <<-)
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
# above function tested in previous rev

## PvL 27/04/14 following function calculates the inverse of a matrix
# which was retrieved from the above function (from cache)
# the result of this is also stored in cache i.e. when the function is run a 2nd time
# the result is not computed again but is taken from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}

#testing of above functions starting testing 1st function (i.e.makeCacheMatrix)
a <-makeCacheMatrix(matrix(1:4,2)) 
a$get()
a$set(matrix(c(2,2,3,2,5,4,7,8,9),3)) # change data and dim of matrix
a$get()
solve(a$get()) # to see what the inverse of the matrix is
#testing of 2nd function i.e. cacheSolve
cacheSolve(a) # using the above defined matrix and compare with solve(a$get())
#other test is multiplying the two matrices
a$get() %*% cacheSolve(a) # this should be the identity matrix (more or less!)
