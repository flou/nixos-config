# nix-darwin configuration

macOS hosts managed with [nix-darwin](https://github.com/nix-darwin/nix-darwin)
and [hjem](https://github.com/feel-co/hjem).

## Layout

- `flake.nix` — inputs and the hostname → user mapping.
- `lib/mksystem.nix` — assembles a `darwinSystem` from the shared modules.
- `lib/modules/` — shared configuration:
  - `darwin.nix` — macOS defaults and system settings.
  - `host.nix` — hostname-derived networking and firewall settings.
  - `user.nix` — primary user and hjem setup.
  - `packages.nix` — packages installed on every host.
- `hosts/<hostname>/` — optional host-specific modules.
- `users/<user>/darwin.nix` — optional per-user modules.

## Usage

```sh
make build          # build the current host
make switch         # build and activate the current host
make diff           # diff the new build against the running system
make rollback       # roll back to the previous generation
make fmt            # format Nix files
make check          # evaluate the flake
```

The host is detected with `scutil --get LocalHostName`. Override it with
`make build HOST=K1QJWD679P`.

## Adding a host or user

Add the hostname and its primary user to the `hosts` attribute in `flake.nix`.
Create `hosts/<hostname>/default.nix` or `users/<user>/darwin.nix` only when
that host or user needs configuration beyond the shared defaults.
