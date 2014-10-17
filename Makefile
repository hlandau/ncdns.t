all:
	GOPATH=$(shell pwd) go build github.com/hlandau/ncdns

call: all
	sudo setcap 'cap_net_bind_service=+ep' ./ncdns
