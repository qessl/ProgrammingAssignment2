# to generate the inverse of any square matrix input 
# two functions are needed: makeCacheMatrix and cacheSolve
# makeCacheMatrix creates a special "matrix" object that caches its inverse
# cacheSolve computes inverse of "matrix" object returned by makeCacheMatrix
# if inverse is already computed, cacheSolve should retrieve it from cache

# makeCacheMatrix
# This function comprises four sub-functions:
# set: First, it sets the matrix. To do this, it saves the matrix
#      represented by y in the parent environment. The inverse inv
#      is set to NULL to reset previous inverses in the cache so that
#      the inverse for the new matrix can be computed.
# get: Next, the matrix is retrieved and returned.
# setinverse: The computation is cached in the parent environment as inv.
# getinverse: Finally, inv is retrieved and returned.

makeCacheMatrix <- function(x = matrix()) {
   inv <- NULL #reset previous inverses
   set <- function(y) { #set matrix
      x <<- y
      inv <<- NULL
   }
   get <- function() x #get matrix
   setinverse <- function(inverse) inv <<- inverse #set inverse
   getinverse <- function() inv #get inverse
   list(set = set, get = get, 
        setinverse = setinverse,
        getinverse = getinverse) #return inverse
}

# cacheSolve
# To compute inverse, this function first checks if it exists in cache.
# If it exists (matrix was already input and inverse already computed), 
#      the console will return the message "getting cached data" and also
#      the computed inverse of the matrix object in the earlier input. 
# If it does not exist (new matrix identified by the system), the inverse
#.     is computed and cached in setinverse under makeCacheMatrix and returned.

cacheSolve <- function(x, ...) {
   inv <- x$getinverse()
   if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
   }
   data <- x$get()
   inv <- solve(data, ...)
   x$setinverse(inv)
   i
}
