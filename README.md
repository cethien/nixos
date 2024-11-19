# NixOS config

## requirements

- NixOS (duh)

## Installation

[setup script](https://github.com/cethien/setup)

## usage

either

```bash
rebuild-os
```

or

```bash
sudo nixos-rebuild switch --flake $HOME/nixos/#pc-cethien
```

## notes

make sure there is a `hardware-configuration.nix` next to the `configuration.nix`. since it gets generated and using the saved one breaks the boot, copy from `/etc/nixos`:

```bash
cp /etc/nixos/hardware-configuration.nix $HOME/nixos/nixos/
```
