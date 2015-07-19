## As the example, I specified the data as a matrix and related the other functions
## inside the makeCacheMatrix to correspond to the variable m. The return value
## is a list with the intern functions.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setSolve <- function(Solve) m <<- Solve
  getSolve <- function() m
  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)
}



## Alsmost the same as the assignment example. The diference lies in the use of
## the solve function to evaluate the inverse of a matrix.

cacheSolve <- function(x, ...) {
  m <- x$getSolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setSolve(m)
  m
}
