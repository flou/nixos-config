HOST ?= $(shell scutil --get LocalHostName 2>/dev/null || hostname -s)

.PHONY: help build dry-run diff switch list-generations rollback fmt check

help:
	@echo "Available targets:"
	@echo "  build             - Build the system configuration"
	@echo "  dry-run           - Show what would be built (dry-run)"
	@echo "  diff              - Show the differences from current system"
	@echo "  switch            - Build and activate the system configuration"
	@echo "  list-generations  - List available system generations"
	@echo "  rollback          - Rollback to the previous generation"
	@echo "  fmt               - Format the Nix files"
	@echo "  check             - Evaluate the flake and run checks"
	@echo ""
	@echo "Host: $(HOST) (override with HOST=<name>)"

build:
	darwin-rebuild build --flake .#$(HOST)

dry-run:
	darwin-rebuild build --flake .#$(HOST) --dry-run --verbose

diff: build
	nix store diff-closures /run/current-system ./result

switch:
	sudo darwin-rebuild switch --flake .#$(HOST)

list-generations:
	sudo darwin-rebuild --list-generations

rollback:
	sudo darwin-rebuild --rollback

fmt:
	nix fmt

check:
	nix flake check
