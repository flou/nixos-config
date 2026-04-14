.PHONY: help build dry-run diff switch list-generations rollback

HOST := Majula

help:
	@echo "Available targets:"
	@echo "  build             - Build the system configuration"
	@echo "  dry-run           - Show what would be built (dry-run)"
	@echo "  diff              - Show the differences from current system"
	@echo "  switch            - Build and activate the system configuration"
	@echo "  list-generations  - List available system generations"
	@echo "  rollback          - Rollback to the previous generation"
	@echo ""
	@echo "Host: $(HOST)"

build:
	darwin-rebuild build --flake .#$(HOST)

dry-run:
	darwin-rebuild build --flake .#$(HOST) --dry-run --verbose

diff: build
	# nix run nix-darwin -- --build --flake .#$(HOST) --diff
	nix store diff-closures /run/current-system ./result

switch:
	sudo darwin-rebuild switch --flake .#$(HOST)

list-generations:
	sudo darwin-rebuild --list-generations --flake .#$(HOST)

rollback:
	sudo darwin-rebuild --rollback --flake .#$(HOST)

work:
	$(MAKE) HOST=K1QJWD679P switch

home:
	$(MAKE) HOST=Majula switch
