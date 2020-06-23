## Put comments here that give an overall description of what your
## functions do

## here first I initialize x and inv (inverse of the matrix), then I set for new values
#then put the functions and a list that it will return. 

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

ma<-matrix(1:4,2,2)
ma
mymat<-makeCacheMatrix(ma)
mymat$get()


## the next function is to get the matrix if already is in the cache or to obtain it 
#form the previous function

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}

cacheSolve(mymat)


