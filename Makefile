-include config.mak

.DEFAULT_GOAL = all

DESTDIR ?= $(HOME)

include bash/rules.mak
include zsh/rules.mak
include git/rules.mak
include editorconfig/rules.mak
include profile/rules.mak
include vscode/rules.mak
endif

.PHONY : all
all : install $(POST_INSTALL)

.PHONY : install
install:
	@printf "%s %s\n" $(INSTALL_PAIRS) | (set -e; while read src dest; do \
		if [ -d "$$src" ]; then \
			printf "%8s %s\n" "DIR" "$(DESTDIR)/$$dest"; \
			mkdir -p "$(DESTDIR)/$$dest"; \
			printf "%8s %s -> %s\n" "SYNC" "$$src" "$(DESTDIR)/$$dest"; \
			rsync -a --exclude '*.mak' "$$src/" "$(DESTDIR)/$$dest/"; \
		else \
			printf "%8s %s -> %s\n" "CP" "$$src" "$(DESTDIR)/$$dest"; \
			mkdir -p $$(dirname "$(DESTDIR)/$$dest"); \
			cp -pr "$$src" "$(DESTDIR)/$$dest"; \
		fi; \
	done)
