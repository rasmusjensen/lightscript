LS = LightScript
DEPS = com/solsort/*/*
BACKUP=

run: examples/Main.class examples/test.js
	java examples/Main examples/test.js
examples/Main.class: $(DEPS)

test: testsuite/LightScriptTest.class
	java testsuite.LightScriptTest testsuite/*.ls

testsuite/LightScriptTest.class: $(DEPS)

all: doc 

backup: clean
	tar cv --no-recursion `find . | grep -v svn` | gzip > backup.tar.gz 

dist: clean all
	tar cv --no-recursion `find Makefile src README COPYING | grep -v svn` | gzip > dist.tar.gz 

doc: doc/javadoc doc/README.html doc/TODO.html
doc/javadoc: $(DEPS) README.md TODO
	mkdir -p doc/javadoc
	echo '<html><body><p>This package contains the LightScript scripting language and various utility functions for mobile applications. The LightScript documentation is included below:</p>' > com/solsort/mobile/package.html
	pandoc README.md >> com/solsort/mobile/package.html
	echo '</body></html>' >> com/solsort/mobile/package.html
	javadoc -d doc/javadoc/public com.solsort.mobile
	javadoc -package -d doc/javadoc/package com.solsort.mobile
	javadoc -private -d doc/javadoc/private com.solsort.mobile

doc/README.html: README.md
	pandoc -s README.md -o doc/README.html

doc/TODO.html: TODO
	pandoc -s TODO -o doc/TODO.html

clean:
	rm -rf doc/javadoc doc/TODO.html doc/README.html `find com examples testsuite -name "*.class"` examples/*.jar examples/*/*.jar com/solsort/mobile/package.html

examples/moby/moby.jar: examples/moby/*.java examples/moby/manifest examples/moby/*.jad $(DEPS)
	javac -source 1.2 -classpath .:external_dependencies/midpapi10.jar examples/moby/*.java
	jar -cvfm examples/in.jar examples/moby/manifest com/solsort/*/*.class examples/moby/*.class
	java -jar external_dependencies/proguard.jar @examples/midlets.pro
	mv examples/out.jar examples/moby/moby.jar

examples/guitest/guitest.jar: examples/guitest/* $(DEPS)
	cd examples/guitest; ln -sf ../../com .
	cd examples/guitest; javac -source 1.2 -classpath .:../../external_dependencies/midpapi10.jar *.java
	cd examples/guitest; jar -cvfm ../in.jar manifest com/solsort/*/*.class *.class script.ls
	cd examples/guitest; rm -f com
	java -jar external_dependencies/proguard.jar @examples/midlets.pro
	mv examples/out.jar examples/guitest/guitest.jar

guitest: examples/guitest/guitest.jar
	../../WTK2.5.2/bin/emulator -cp examples/guitest/guitest.jar Midlet

ex: examples/moby/moby.jar

st: clean
	git status || echo

diff: clean
	git diff 

commit: clean
	git add `find * -name "*.java"` testsuite/*.ls Makefile README.md TODO
	git commit -m autocommit

.SUFFIXES: .java .class

.java.class: $(DEPS)
	javac -source 1.2 $*.java

