# Nix Darwin + Home Manager

[nix-darwin](https://github.com/LnL7/nix-darwin) + [home-manager](https://github.com/nix-community/home-manager) configuration using [flake-parts](https://github.com/hercules-ci/flake-parts).
Tracks `nixpkgs-unstable`. Supports macOS (`aarch64-darwin` / `x86_64-darwin`).

## File structure

```
~/
├── flake.nix                        # Inputs and flake-parts outputs
├── flake.lock                       # Pinned inputs — commit this
├── darwin/
│   ├── default.nix                  # darwinConfigurations, one entry per host
│   ├── configuration.nix            # Shared macOS system config (touch ID, fish, users)
│   ├── apps.nix                     # Homebrew casks
│   ├── fonts.nix                    # System fonts
│   └── hosts/
│       └── jgagnon-wsmb.nix     # Host: aarch64-darwin, sets hostname
├── home-manager/
│   ├── default.nix                  # Shared home config (imports all modules)
│   ├── hosts/
│   │   └── jgagnon-wsmb.nix     # Host-specific home overrides
│   └── modules/
│       ├── base.nix                 # Core packages + neovim
│       ├── fish.nix                 # Fish shell + starship + abbreviations
│       ├── git.nix                  # Git + delta + jujutsu
│       └── tmux.nix                 # Tmux (C-a prefix, vi mode)
└── README.md
```

### Adding a new system

1. Create `darwin/hosts/<hostname>.nix` importing `../configuration.nix` and setting `networking.hostName`.
2. Create `home-manager/hosts/<hostname>.nix` importing `../default.nix`.
3. Add an entry to `flake.darwinConfigurations` in `darwin/default.nix`.

---

## Installed packages

### Nix packages

| Module | Package | Description |
|--------|---------|-------------|
| `base.nix` | `bat` | `cat` with syntax highlighting |
| `base.nix` | `curl` | HTTP client |
| `base.nix` | `fzf` | Fuzzy finder |
| `base.nix` | `ripgrep` | Fast grep (`rg`) |
| `base.nix` | `rsync` | File sync / transfer |
| `base.nix` | `claude-code` | Claude Code CLI |
| `base.nix` | `neovim` | Default editor |
| `fish.nix` | `mise` | Dev tool version manager |
| `fish.nix` | `starship` | Cross-shell prompt |
| `git.nix` | `jujutsu` | `jj` VCS |
| `git.nix` | `git-delta` | Better git diffs |

### Homebrew casks (`darwin/apps.nix`)

| Cask | Description |
|------|-------------|
| `ghostty` | GPU-accelerated terminal emulator |
| `claude` | Claude desktop app |
| `spotify` | Music streaming client |

> Casks not listed in `apps.nix` are automatically removed on the next rebuild (`cleanup = "zap"`).

### Fonts (`darwin/fonts.nix`)

| Font | Description |
|------|-------------|
| JetBrains Mono Nerd Font | Coding font with icon glyphs (used by starship / tmux) |

---

## Prerequisites

1. **Install Nix** (Determinate installer recommended — enables flakes by default):
   ```sh
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. **Install Homebrew** (required for cask management):
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

---

## First-time setup

```sh
cd ~/.dotfiles

# Bootstrap nix-darwin using the hostname as the configuration name
nix run nix-darwin -- switch --flake ".#$(hostname -s)"
```

After the first switch, `darwin-rebuild` is available on your `$PATH`.

---

## Day-to-day usage

### Apply changes

```sh
drs   # darwin-rebuild switch using current hostname
drup  # nix flake update then drs
```

Or manually:

```sh
darwin-rebuild switch --flake "$HOME/.dotfiles#$(hostname -s)"
```

### Add a Nix package

1. Find the package at [search.nixos.org](https://search.nixos.org/packages?channel=unstable).
2. Add it to the appropriate module in `home-manager/modules/`, e.g. `base.nix`:
   ```nix
   home.packages = with pkgs; [
     bat curl fzf ripgrep rsync
     htop  # <-- new package
   ];
   ```
3. Run `drs`.

### Add a Homebrew cask

1. Find the cask at [formulae.brew.sh/cask](https://formulae.brew.sh/cask/).
2. Add it to `homebrew.casks` in `darwin/apps.nix`:
   ```nix
   casks = [
     { name = "ghostty"; }
     { name = "firefox"; }  # <-- new cask
   ];
   ```
3. Run `drs`.

### Add a host-specific package or setting

Put overrides in the host's file rather than the shared modules:

```nix
# home-manager/hosts/jgagnon-wsmb.nix
{ pkgs, ... }: {
  imports = [ ../default.nix ];

  home.packages = with pkgs; [ some-work-tool ];
}
```

### Update nixpkgs

```sh
drup   # updates flake.lock then applies
```

Commit `flake.lock` to pin exact versions for reproducibility.
