PLLEL:=-j11
VARIANT:=debug

COMMON_CONF_FLAGS:=--enable-debug --disable-hardening --disable-bench --disable-tests --disable-gui-tests --with-gui=no 

BU_CONF_FLAGS:=$(COMMON_CONF_FLAGS) --enable-gperf
XT_CONF_FLAGS:=$(COMMON_CONF_FLAGS)
ABC_CONF_FLAGS:=$(COMMON_CONF_FLAGS)

.PHONY: bu abc xt 

all: bu abc xt

clean:
	-(cd bucash/$(VARIANT); make clean)
	-(cd xt/$(VARIANT); make clean)
	-(cd abc/$(VARIANT); make clean)


bu:
	(cd bucash; ./autogen.sh)
	(cd bucash; mkdir -p $(VARIANT))
	(cd bucash/$(VARIANT); ../configure $(BU_CONF_FLAGS))
	(cd bucash/$(VARIANT); $(MAKE) $(PLLEL))

xt:
	(cd xt; ./autogen.sh)
	(cd xt; mkdir -p $(VARIANT))
	(cd xt/$(VARIANT); ../configure $(XT_CONF_FLAGS))
	(cd xt/$(VARIANT); $(MAKE) $(PLLEL))

abc:
	(cd abc; ./autogen.sh)
	(cd abc; mkdir -p $(VARIANT))
	(cd abc/$(VARIANT); ../configure $(ABC_CONF_FLAGS))
	(cd abc/$(VARIANT); $(MAKE) $(PLLEL))


