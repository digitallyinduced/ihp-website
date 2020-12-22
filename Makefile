ifneq ($(wildcard IHP/.*),)
IHP = IHP/lib/IHP
else
IHP = $(shell dirname $$(which RunDevServer))/../lib/IHP
endif

include ${IHP}/Makefile.dist

CSS_FILES += ${IHP}/static/vendor/bootstrap.min.css
CSS_FILES += static/layout.css
CSS_FILES += static/startpage.css
CSS_FILES += static/app.css

JS_FILES += ${IHP}/static/vendor/jquery-3.2.1.slim.min.js
JS_FILES += ${IHP}/static/vendor/timeago.js
JS_FILES += ${IHP}/static/vendor/popper.min.js
JS_FILES += ${IHP}/static/vendor/bootstrap.min.js

build/ihp-src:
	git clone --depth 1 https://github.com/digitallyinduced/ihp.git build/ihp-src

static/ihp-new.tar.gz: build/ihp-src
	( cd build/ihp-src/ProjectGenerator; make tarball.tar.gz )
	mv build/ihp-src/ProjectGenerator/tarball.tar.gz static/ihp-new.tar.gz

static/Guide: build/ihp-src
	( cd build/ihp-src; nix-shell --command "cd Guide; make all")
	rm -rf static/Guide
	cp -R build/ihp-src/Guide static/Guide

static/api-docs: build/ihp-src
	( cd build/ihp-src; nix-shell --command "chmod +x build-haddock; ./build-haddock" )
	mv build/ihp-src/haddock-build static/api-docs

build/bin/RunUnoptimizedProdServer: static/ihp-new.tar.gz static/Guide static/api-docs
build/bin/RunOptimizedProdServer: static/ihp-new.tar.gz static/Guide static/api-docs