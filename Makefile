# convenience makefile to boostrap & run buildout
# use `make options=-v` to run buildout with extra options

version = 2.7
python = bin/python
options =

all: tests

docs: docs/html/index.html src/tribuna.content/docs/html/index.html src/tribuna.annotator/docs/html/index.html src/tribuna.policy/docs/html/index.html

docs/html/index.html: docs/*.rst bin/sphinx-build
	bin/sphinx-build docs docs/html
	@touch $@
	@echo "Documentation was generated at '$@'."

src/tribuna.content/docs/html/index.html: src/tribuna.content/docs/*.rst bin/sphinx-build src/tribuna.content/*.rst
	bin/sphinx-build src/tribuna.content/docs src/tribuna.content/docs/html
	@touch $@
	@echo "Documentation was generated at '$@'."

src/tribuna.annotator/docs/html/index.html: src/tribuna.annotator/docs/*.rst bin/sphinx-build src/tribuna.annotator/*.rst
	bin/sphinx-build src/tribuna.annotator/docs src/tribuna.annotator/docs/html
	@touch $@
	@echo "Documentation was generated at '$@'."

src/tribuna.policy/docs/html/index.html: src/tribuna.policy/docs/*.rst bin/sphinx-build src/tribuna.policy/*.rst
	bin/sphinx-build src/tribuna.policy/docs src/tribuna.policy/docs/html
	@touch $@
	@echo "Documentation was generated at '$@'."

bin/sphinx-build: .installed.cfg
	@touch $@

.installed.cfg: bin/buildout buildout.cfg buildout.d/*.cfg setup.py
	bin/buildout $(options)

bin/buildout: $(python) buildout.cfg bootstrap.py
	$(python) bootstrap.py -d
	@touch $@

$(python):
	virtualenv -p python$(version) --no-site-packages .
	@touch $@

tests: .installed.cfg
	@bin/test
	# @bin/flake8 setup.py
	# @bin/flake8 src/tribuna/buildout
	@for pt in `find src/tribuna.* -name "*.pt"` ; do bin/zptlint $$pt; done
	@for xml in `find src/tribuna.* -name "*.xml"` ; do bin/zptlint $$xml; done
	@for zcml in `find src/tribuna.* -name "*.zcml"` ; do bin/zptlint $$zcml; done

clean:
	@rm -rf .installed.cfg .mr.developer.cfg bin docs/html parts develop-eggs \
		src/tribuna.buildout.egg-info lib include .Python

.PHONY: all docs tests clean
