#!/usr/bin/python3

'''
this script will install all the required packages that you need on
ubuntu to compile and work with this package.
'''

import subprocess # for check_call

do_mine=False

packs=[
	# R core
	'r-base-core',
	'r-doc-info',
	'r-doc-html',
	'r-doc-pdf',

	# R packages
	'r-cran-sm',
	'r-cran-plotrix',
	'r-cran-snow',
]

if do_mine:
	packs.extend([
		# for building from my own repo
		'templar',
		'pdmt',
	])

args=['sudo','apt-get','install','--assume-yes']
args.extend(packs)
subprocess.check_call(args)
