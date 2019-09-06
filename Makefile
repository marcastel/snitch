SHELL = /bin/ksh

all: blacklist whitelist

domains:
	vi -O blacklist.domains whitelist.domains

hosts:
	vi -O blacklist.hosts whitelist.hosts

blacklist:
	./build.sh blacklist

whitelist:
	./build.sh whitelist

commit:
	git commit -m "$$(printf 'Updates %(%F [%a] %R)T.')" *
	git push

