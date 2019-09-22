SHELL = /bin/ksh

all: blacklist whitelist

domains:
	vi -O blacklist.domains whitelist.domains

hosts:
	vi -O blacklist.hosts whitelist.hosts

blacklist:
	./snitch build-rss blacklist

whitelist:
	./snitch build-rss whitelist

commit:
	git commit -m "$$(printf 'Updates %(%F [%a] %R)T.')" *
	git push

