SHELL = /bin/ksh

all: blacklist whitelist

domains:
	vi -O blacklist.domains whitelist.domains

hosts:
	vi -O blacklist.hosts whitelist.hosts

blacklist:
	bin/snitch build-rss blacklist

whitelist:
	bin/snitch build-rss whitelist

commit:
	git commit -m "$$(printf 'Updates %(%F [%a] %R)T.')" var/*
	git push

