SHELL = /bin/ksh

all: blacklist whitelist

blacklist:
	./build.sh blacklist

whitelist:
	./build.sh whitelist

commit:
	git commit -m "$$(printf 'Updates %(%F [%a] %R)T.')" *
	git push

