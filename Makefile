.PHONY: all
all: tools.stamp
	@true

tools.stamp: templardefs/deps.py
	$(info doing [$@])
	@templar install_deps
	@pymakehelper touch_mkdir $@

.PHONY: sloccount
sloccount:
	$(info doing [$@])
	$(Q)sloccount .

.PHONY: clean
clean:
	find . -name ".RData" -or -name ".Rhistory" -exec rm {} \;
