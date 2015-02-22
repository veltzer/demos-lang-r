#!/usr/bin/Rscript

# This shows that printing a functions which is coded in R will
# give you it's source code.
# Printing a function which is native will also reveal that fact by printing that
# the function is '.Primitive'.

sayHello <- function() {
	print('hello world!\n')
}
print(sayHello)
# 'sum' is a primitive function
print(sum)
