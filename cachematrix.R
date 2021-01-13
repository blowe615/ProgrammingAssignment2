## Functions to cache and retrieve the inverse of a matrix so that 
## repeated computations are not required

## Create a list of functions to set and get the matrix and
## set and get the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    ## Inputs
    ## x: an invertible matrix, default is an empty matrix
    ## Returns
    ## List of 4 functions to set and get the original matrix 'x' and to 
    ## set and get the inverse matrix of 'x'
    
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
    ## Inputs
    ## x: list of functions returned from makeCacheMatrix
    ## ...: additional arguments to pass to solve()
    ## Returns
    ## xinv: inverse matrix of 'x'
    
    # Check if the inverse already exists
    xinv <- x$getinv()
    # If getinv() does not return NULL
    if (!is.null(xinv)) {
        message("getting cached data...")
        # Return the inverse matrix of 'x'
        return(xinv)
    }
    # Otherwise calculate and set the inverse
    else {
        data <- x$get() # get original matrix 'x'
        xinv <- solve(data,...) # calculate inverse matrix
        x$setinv(xinv) # set inverse matrix in cache
        return(xinv) # return inverse matrix of 'x'
    }
}
