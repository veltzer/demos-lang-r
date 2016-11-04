'''
dependencies for this project
'''

def populate(d):
    d.packs=[
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

def getdeps():
    return [
        __file__, # myself
    ]
