## Functions to cache and retrieve the inverse of a matrix so that 
## repeated computations are not required

## Create a list of functions to set and get the matrix and
## set and get the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    # Initialize the inverse matrix as NULL
    xinv <- NULL
    # Define the set matrix function
    set <- function(y) {
        # Initializes the matrix and inverse matrix if one is not passed
        # when makeCacheMatrix is called
        x <<- y
        xinv <<- NULL
    }
    # Define the get matrix function
    get <- function() x # Returns the matrix x
    # Define the set inverse matrix function
    setinv <- function(inv) xinv <<- inv # Assigns inverse matrix in cache
    # Define the get inverse matrix function
    getinv <- function() xinv # Returns the inverse matrix from cache
    
    # Return list of functions
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Calculate the inverse of matrix 'x' using the solve() function
## or retrieve the inverse from the cache if it has already been calculated

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
