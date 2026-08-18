# Config-files

A personal macOS rice with a dark monochrome, Darkthrone-inspired look. It is built around Apple Silicon macOS and a terminal-heavy workflow, with tiling windows, a minimal status bar, and matching editor and CLI themes. Treat these files as a starting point, not a drop-in installer.

## What is included

| Area | Purpose | Key entry files |
| --- | --- | --- |
| Window management | Choose Aerospace, or yabai with skhd shortcuts | `.aerospace.toml`, `.yabairc`, `.skhdrc` |
| Bar and borders | Desktop status bar and window borders | `.config/sketchybar/sketchybarrc`, `.config/sketchybar/plugins/`, `.config/borders/bordersrc` |
| Terminal and shell | Ghostty, Bash/Zsh, Starship, and tmux | `.config/ghostty/config`, `.bashrc`, `.zshrc`, `.config/starship.toml`, `.config/tmux/tmux.conf` |
| Editors | Neovim with LazyVim, Helix, and Zed | `.config/nvim/`, `.config/helix/`, `.config/zed/settings.json` |
| CLI and media | btop, cava, fastfetch, and ncspot | `.config/btop/`, `.config/cava/`, `.config/fastfetch/`, `.config/ncspot/` |
| Other terminal work | Wave Terminal | `.config/waveterm/settings.json` |

The setup assumes macOS on Apple Silicon. The main tool groups present are Aerospace; yabai and skhd; SketchyBar; borders; Ghostty; Starship; tmux; Neovim/LazyVim; Helix; btop; cava; fastfetch; ncspot; Zed; and Wave Terminal.

## Repository layout

Files at the repository root are home-directory dotfiles. For example, `.zshrc` becomes `$HOME/.zshrc` and `.aerospace.toml` becomes `$HOME/.aerospace.toml`. The `.config/` directory becomes `$HOME/.config/`, so `.config/nvim/` becomes `$HOME/.config/nvim/`.

Both `.tmux.conf` and `.config/tmux/tmux.conf` are included because the root file is tmux's default entrypoint, while the `.config` copy is the reload target. Keep them in sync if you edit one.

## Before applying

- [ ] Apple Silicon Mac running macOS.
- [ ] Homebrew or another package manager, plus the tools used by the parts of the rice you want.
- [ ] A Nerd Font installed and selected in Ghostty and any other terminal or editor that needs its glyphs.
- [ ] Ghostty and the command-line tools you plan to use: shell, Starship, tmux, Neovim, Helix, btop, cava, fastfetch, and ncspot.
- [ ] The GUI apps you plan to use: Zed and Wave Terminal.
- [ ] SketchyBar and borders.
- [ ] One window-manager path: Aerospace, or yabai plus skhd. Grant the macOS permissions requested by the selected tools, especially Accessibility permissions.
- [ ] tmux Plugin Manager (TPM), with network access available for its plugins.

Install each project through its official instructions or your package manager. This repository does not pin a complete package list or versions.

## Preview, then apply

Do not copy these files over an existing home directory without reviewing the changes. From the repository root, first run a dry run:

```sh
# Review what would be copied. This does not change $HOME.
rsync -av --dry-run --itemize-changes \
  --exclude='.git/' \
  --exclude='.pi/' \
  --exclude='README.md' \
  --exclude='LICENSE' \
  --exclude='.gitignore' \
  ./ "$HOME"/
```

Inspect the file list and compare any important existing configuration manually. When you are ready, apply the same copy with backups. This command does not delete files from your home directory:

```sh
# Existing destination files replaced by rsync get a .dotfiles-backup suffix.
rsync -av --backup --suffix=.dotfiles-backup \
  --exclude='.git/' \
  --exclude='.pi/' \
  --exclude='README.md' \
  --exclude='LICENSE' \
  --exclude='.gitignore' \
  ./ "$HOME"/
```

You can also copy only the directories or dotfiles you intend to use. Keep the dry run and exclusions when doing so.

## Choose one window manager

Use **Aerospace** or **yabai + skhd**, but do not run both window managers together. Aerospace is configured by `.aerospace.toml`. The yabai route uses `.yabairc` and `.skhdrc`.

SketchyBar's workspace click action currently calls `yabai`, so choosing Aerospace requires adapting that action and any other yabai-dependent scripts before relying on the bar. Start only the selected window manager, then start SketchyBar and borders using the service or app setup from their installation method.

## First run

1. Review and adapt the machine-specific values below before launching the services.
2. Open Neovim. The config bootstraps `lazy.nvim`, then installs or updates its LazyVim and configured plugins. The first launch needs Git and network access.
3. Start tmux. If `~/.config/tmux/plugins/tpm` does not already exist, bootstrap TPM first:

   ```sh
   git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   ```

   Then press `Ctrl-a`, then `I` to install TPM plugins. The plugin path expected by this config is `~/.config/tmux/plugins/tpm/tpm`.
4. Start the selected window manager, SketchyBar, and borders. Reload their configs after making changes.
5. Open Ghostty and select the installed Nerd Font. Check the bar and terminal before making the setup your default session.

## Adapt these local paths and assumptions

Search the repository for `/Users/mark` and adjust every path that should belong to you:

```sh
grep -RIl --exclude-dir=.git --exclude-dir=.pi '/Users/mark' .
```

Known values that are specific to the source machine include:

- `/opt/homebrew/bin/bash` in the tmux configuration. Change it if Bash lives elsewhere.
- btop's versioned Homebrew theme path, currently `/opt/homebrew/Cellar/btop/1.4.7/share/btop/themes/everforest-dark-hard.theme`. Point `color_theme` at a theme that exists on your machine, or use a built-in theme.
- `/Library/Frameworks/Python.framework/Versions/3.14` in `.zprofile`. Remove or update it if that Python installation is not present.
- `/Users/mark/.spicetify` in `.zshrc`, if Spicetify is not installed for your account.
- CAVA's audio source, currently `Background Music`. Select the source exposed by your audio routing setup.
- Ghostty and several service configurations assume macOS behavior, macOS paths, and macOS tools such as `pbcopy`. Review them before using the setup on another platform.

## Troubleshooting

- **Missing symbols or broken icons:** install a Nerd Font and select the same font in Ghostty, tmux, and your editors. Restart the affected app after changing fonts.
- **btop cannot load its theme:** the Homebrew Cellar path is versioned. Update `color_theme` in `.config/btop/btop.conf` or switch to a theme available under `~/.config/btop/themes`.
- **tmux says TPM is missing:** install TPM at `~/.config/tmux/plugins/tpm`, or change the final `run` line in the tmux config to match your chosen plugin path. Then install the declared plugins from inside tmux.
- **cava has no audio:** `Background Music` is the configured source, not a universal macOS device name. Change `source` to the name provided by your audio setup.
- **The bar or tiling does not start:** check that the app is installed, its macOS permissions are granted, and its service is running. Start only one of Aerospace or yabai, and remember that the current SketchyBar click action expects yabai.

## Exclusions

This repository intentionally excludes credentials, histories, user state, caches, and vendored plugins. It also excludes generated or machine-specific application data such as ncspot state and Zed prompts. `.gitconfig` is not included; the `.config/git/ignore` file is only the global ignore configuration copied here.

There is no installer. Keep your own backups, review the dry-run output, and adapt the configs before applying them.
