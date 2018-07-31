## In order to reduce the time to calculate the inverse of a matrix,
## we cache the result.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL

      set <- function(y) {
              x <<- y
              inv <<- NULL
      }

      get <- function() x

      setInverse <- function (y) inv <<- y

      getInverse <- function (y) inv

      return(list(set = set, get = get,
              setInverse = setInverse, getInverse = getInverse))
}


## Solves and caches the inverse of a "cache matrix"

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()

        if(!is.null(inv)){
                print("Getting cached data: ")
                return(inv)
        }

        inv <- solve(x$get())
        x$setInverse(inv)
        ## Return a matrix that is the inverse of 'x'
        inv
}
