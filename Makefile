PREFIX = /usr/local

portraitize: portraitize.sh
	cat portraitize.sh > $@

	chmod +x $@

test: portraitize.sh
	shellcheck -s sh portraitize.sh

clean:
	rm -f portraitize

install: portraitize
	#run installReq.sh to install dependencies
	./installReq.sh
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f portraitize $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/portraitize

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/portraitize

.PHONY: test clean install uninstall
