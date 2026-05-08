# homebrew-driftr

[Homebrew](https://brew.sh) tap for [Driftr](https://github.com/DriftrLabs/driftr) — fast JavaScript toolchain versioning without the friction.

## Install

```bash
brew tap DriftrLabs/driftr
brew install driftr
```

## Post-install setup

Homebrew places the `driftr` binary in `/opt/homebrew/bin/` (Apple Silicon) or `/usr/local/bin/` (Intel). Two more steps are required before Driftr works:

```bash
# 1. Create shims and data directories
driftr setup

# 2. Add ~/.driftr/bin to the front of PATH (before Homebrew)
echo 'export PATH="$HOME/.driftr/bin:$PATH"' >> ~/.zshenv
echo 'export PATH="$HOME/.driftr/bin:$PATH"' >> ~/.zprofile
```

Or let `driftr doctor --fix` handle PATH configuration automatically.

## Why PATH order matters

Driftr's shims (`node`, `npm`, `pnpm`, `yarn`) live in `~/.driftr/bin/`. On macOS, login shells invoke `/usr/libexec/path_helper` which reorders PATH and puts `/opt/homebrew/bin` first — causing Homebrew's system `node` to shadow Driftr's shims. Adding the export to `~/.zprofile` ensures Driftr wins after `path_helper` runs.

Run `driftr doctor` to verify your setup is correct.

## Upgrade

```bash
brew upgrade driftr
```

## More

Full docs: [github.com/DriftrLabs/driftr](https://github.com/DriftrLabs/driftr)
