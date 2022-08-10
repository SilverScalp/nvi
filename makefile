PREFIX = /usr/local

nvi: nvi.sh nvi.awk nvi.tsv
	cat nvi.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar czf - nvi.awk nvi.tsv >> $@
	chmod +x $@

test: nvi.sh
	shellcheck -s sh nvi.sh

clean:
	rm -f nvi

install: nvi
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f nvi $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/nvi

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/nvi

.PHONY: test clean install uninstall