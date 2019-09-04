SHELL = /bin/ksh

all: blacklist whitelist

blacklist:
	./build.sh blacklist

whitelist:
	./build.sh whitelist

commit:
	git commit -am "=$$(printf 'Updates %(%F [%a] %R)T.')"
	git push

