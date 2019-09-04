SHELL = /bin/ksh

all: blacklist whitelist

blacklist:
	./build.sh blacklist
	$(MAKE) commit

whitelist:
	./build.sh whitelist
	$(MAKE) commit

commit:
	git commit -am "=$(printf 'Updates %(%F [%a] %R)T.')"
	git push

