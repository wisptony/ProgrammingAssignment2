## makeCacheMatrix is a function for Caching already inverted
## matrices along with other functions to help the functioning
## of cacheSolve

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- funciton() x
  setinvert <- function(invert) i <<- invert
  getinvert <- function() i
  list(set=set, get=get, setinvert=setinvert, getinvert=getinvert)
}


## cachesolve function takes cached matrix out and check if it
## is already inverted. If yes, then it returns a message and 
## the inverted matrix, if not it invert the input matrix and
## store it in cache.

cacheSolve <- function(x, ...) {
  i <- x$getinvert()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
        ## Return a matrix that is the inverse of 'x'
  data <- x$get()
  i <- solve(data, ...)
  x$setinvert(i)
  i
}
