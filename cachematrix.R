## The below functions are used to cache the inverse of a matrix to avoid needing
## to compute it each time

## The following function creates a matrix and contains the functions to set the matrix value,
## get the matrix, set the inverse value of the matrix, and get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## The following function checks whether the inverse of the matrix has previously been
## calculated and, if so, returns the cached invers. If not, it computes the inverse and 
## returns the result

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
