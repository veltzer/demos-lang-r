##############
# parameters #
##############
# do you want to show the commands executed ?
DO_MKDBG:=0
# do you want dependency on the Makefile itself ?
DO_ALLDEP:=1

#########
# rules #
#########
.PHONY: all
all:
	@true

.PHONY: sloccount
sloccount:
	$(info doing [$@])
	$(Q)sloccount .

.PHONY: clean
clean:
	$(Q)find . -name ".RData" -or -name ".Rhistory" -exec rm {} \;

##########
# alldep #
##########
ifeq ($(DO_ALLDEP),1)
.EXTRA_PREREQS+=$(foreach mk, ${MAKEFILE_LIST},$(abspath ${mk}))
endif # DO_ALLDEP
