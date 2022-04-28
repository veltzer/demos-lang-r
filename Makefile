.PHONY: all
all: tools.stamp
	@true

tools.stamp: config/deps.py
	$(info doing [$@])
	$(Q)pymakehelper touch_mkdir $@

.PHONY: sloccount
sloccount:
	$(info doing [$@])
	$(Q)sloccount .

.PHONY: clean
clean:
	$(Q)find . -name ".RData" -or -name ".Rhistory" -exec rm {} \;
