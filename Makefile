MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKEFILE_DIR := $(dir $(MAKEFILE_PATH))

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
CYAN   := $(shell tput -Txterm setaf 6)
RESET  := $(shell tput -Txterm sgr0)

.DEFAULT_GOAL := help
.PHONY: help

## Build:
.PHONY: build
build: ## Remove comments and shebang from script
	@echo "+$@"
	@mkdir -p $(MAKEFILE_DIR)/build
	@sed '/^[[:blank:]]*#/d;s/[[:blank:]]*#.*//' src/sixlogger.sh > $(MAKEFILE_DIR)/build/sixlogger.sh
	@chmod +x $(MAKEFILE_DIR)/build/sixlogger.sh

container-images: ## Build container images for `shellspec`
	@echo "+ $@"
	@for dockerfile in $(MAKEFILE_DIR)/docker/*.dockerfile; do \
		os=$$(basename $${dockerfile} .dockerfile); \
		echo -e "\n+ Building '$${os}' container image..."; \
		docker buildx build \
			--tag "shellspec-$${os}" \
			--file "$$dockerfile" \
			"${script_dir}/.."; \
	done

.PHONY: vagrant
VAGRANT_DEFAULT_PROVIDER := "virtualbox"
vagrant-up: ## Start Vagrant VMs for `shellspec`
	@echo "+ $@"
	@echo -e "\n+ Starting Vagrant VMs..."
	@export VAGRANT_CWD=$(MAKEFILE_DIR)/vagrant && vagrant up

vagrant-halt: ## Halt Vagrant VMs
	@echo "+ $@"
	@echo -e "\n+ Halting Vagrant VMs..."
	@export VAGRANT_CWD=$(MAKEFILE_DIR)/vagrant && vagrant halt

## Test:
ALTSHFMT_VERSION :=0.2.0
download-altshfmt: ## Download `altshfmt` to format `shellspec` files
	@echo "+ $@"
	@echo -e "\n+ Downloading altshfmt version '${ALTSHFMT_VERSION}'..."
	@curl -L "https://github.com/shellspec/altshfmt/archive/refs/tags/v${ALTSHFMT_VERSION}.tar.gz" | tar -xzv
	@mv "altshfmt-${ALTSHFMT_VERSION}/altshfmt" $(MAKEFILE_DIR)/scripts/altshfmt
	@rm -r "altshfmt-${ALTSHFMT_VERSION}/"

format: ## Format shell scripts with `shfmt` and `altshfmt`
	@echo "+ $@"
	@echo -e "\n+ Running shfmt..."
	@shfmt --write $(MAKEFILE_DIR)/src/ $(MAKEFILE_DIR)/examples/ $(MAKEFILE_DIR)/scripts/
	@echo -e "\n+ Running altshfmt..."
	@$(MAKEFILE_DIR)/scripts/altshfmt -w -ln=posix spec/

lint: ## Check code style with `shellcheck`
	@echo "+ $@"
	@echo -e "\n+ Running shellcheck..."
	@shellcheck **/*.sh

shellspec-gen-bin: ## Generate `shellspec` test support commands in "spec/support/bin"
	@echo "+ $@"
	@echo -e "\n+ Generating shellspec test support commands..."
	@shellspec --gen-bin @date

test: build shellspec-gen-bin ## Run tests with `shellspec`
	@echo "+ $@"
	@echo -e "\n+ Running shellspec..."
	@shellspec

test-coverage: build shellspec-gen-bin ## Test and check code coverage with `shellspec` and `kcov`
	@echo "+ $@"
	@echo -e "\n+ Running shellspec and kcov..."
	@shellspec --kcov --shell bash

test-all: build container-images vagrant-up ## Test multiple shells in different OSes with container images and VMs
	@echo "+ $@"
	@echo -e "\n+ Running all shellspec tests..."
	@$(MAKEFILE_DIR)/scripts/run_tests.sh
	@make vagrant-halt

## Release:
bump: ## Bump semantic version based on the git log and generate changelog
	@echo "+ $@"
	@echo -e "\n+ Running cz bump..."
	@git config --local core.commentChar ";"
	@(current_version="$$(cz version --project)" \
		&& next_version="$$(cz bump --get-next --yes)" \
		&& if [ "$$current_version" != "0.0.1" ]; then changelog_start_rev="--start-rev $${current_version}"; fi \
		&& short_changelog="$$(eval cz changelog --dry-run --extra 'create_short_changelog=true' --unreleased-version "$$next_version" "$$changelog_start_rev")" \
		&& cz changelog --unreleased-version "$$next_version" \
		&& cz bump --annotated-tag-message "$$short_changelog" --yes \
		&& git push \
		&& git push origin tag "$$next_version") || (git config --local core.commentChar "auto" && exit 1)
	@git config --local core.commentChar "auto"

pre-commit: ## Configure pre-commit and run on all the files in the repo
	@echo "+ $@"
	@echo -e "\n+ Running pre-commit hooks..."
	@pre-commit install --install-hooks
	@pre-commit run --all-files

## Help:
help: ## Show this help
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} { \
		if (/^[a-zA-Z_-]+:.*?##.*$$/) {printf "    ${YELLOW}%-20s${GREEN}%s${RESET}\n", $$1, $$2} \
		else if (/^## .*$$/) {printf "  ${CYAN}%s${RESET}\n", substr($$1,4)} \
		}' $(MAKEFILE_LIST)
