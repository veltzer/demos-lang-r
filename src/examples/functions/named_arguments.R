#!/usr/bin/Rscript

# This example shows named arguments

# This is the most simple function, only made of statements
myfunc <- function(a, b) {
	cat("a is", a, "\n")
	cat("b is", b, "\n")
}

# there are many ways to call this function
myfunc(4,5)
myfunc(a=4,5)
myfunc(4,b=5)
myfunc(a=4,b=5)
myfunc(b=5,a=4)

# these will create errors...
# argument "a" is missing, with no default
#myfunc(b=5)
# argument "b" is missing, with no default
#myfunc(a=4)
# argument "a" is missing, with no default
#myfunc()
# unused argument (c = 7)
#myfunc(c=7)
