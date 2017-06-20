BIN_DIR := bin
SCRIPTS := $(wildcard $(BIN_DIR)/*.sh)

.PHONY: all update enable init brew_install install apps
all: update enable init brew_install install apps

update:
	@which git > /dev/null 2>&1

enable:
	@$(foreach script, $(SCRIPTS), $(shell chmod +x $(script)))

init:enable
	@$(BIN_DIR)/init.sh

install:enable
	@$(BIN_DIR)/install.sh

brew_install:enable
	@$(BIN_DIR)/brew_install.sh

apps:enable
	@$(BIN_DIR)/apps.sh
