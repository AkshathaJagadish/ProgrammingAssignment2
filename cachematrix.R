## Caching the Inverse of a Matrix

## The first function, makeCacheMatrix creates a special "matrix" , which is really a list 
## a list containing a fuction to 
## 1.set or create a matrix
## 2.get the matrix
## 3.set the inverse of the matrix
## 4.get the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        invm <- NULL
        set <- function(y) {
                x <<- y
                invm <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) invm <<- inverse
        getInverse <- function() invm
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## This function computes the inverse of the matrix created by 
## makeCacheMatrix above. If the inverse has already been calculated and the
## matrix has not changed then it should retrieve the inverse from the cache


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invm <- x$getInverse()
		##check if inverse matrix is already computed if so return the cached inverse matrix
        if (!is.null(invm)) {
                message("getting cached data")
                return(inv)
        }
        rmat <- x$get()
		## compute the inverse matrix
        invm <- solve(rmat, ...)
		## setting the inverse matrix to the list
        x$setInverse(invm)
        invm
}
