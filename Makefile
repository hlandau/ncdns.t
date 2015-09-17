PROJNAME=github.com/hlandau/ncdns
BINARIES=$(PROJNAME) $(PROJNAME)/ncdt

call: all
	#sudo setcap 'cap_net_bind_service=+ep' bin/ncdns

#####################################################################
# 1.1
ifeq ($(GOPATH),)
GOPATH := $(shell pwd)
endif
ifeq ($(GOBIN),)
GOBIN := $(GOPATH)/bin
endif

DIRS=src bin public

all: $(DIRS)
	go install $(BUILDFLAGS) $(BINARIES)

$(DIRS): | .gotten
	if [ ! -e "src" ]; then \
	  ln -s $(GOPATH)/src src; \
	fi
	if [ ! -e "bin" ]; then \
		ln -s $(GOBIN) bin; \
	fi

.gotten:
	go get $(PROJNAME)
	touch .gotten

test:
	go test -cover -v $(PROJNAME)/...
