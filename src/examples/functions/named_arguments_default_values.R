#!/usr/bin/Rscript

# This example shows named arguments with default values

# This is the most simple function, only made of statements
myfunc <- function(a=4, b=5) {
	cat("a is", a, "\n")
	cat("b is", b, "\n")
}

# we can supply both arguments
myfunc(4,5)
myfunc(a=4,5)
myfunc(4,b=5)
myfunc(a=4,b=5)
myfunc(b=5,a=4)

# or just the ones we want to be different from the default
myfunc(b=5)
myfunc(a=4)
myfunc()

# these will create errors...
# unused argument (c = 7)
#myfunc(c=7)
