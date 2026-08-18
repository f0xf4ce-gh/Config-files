# Project Handoff

## Last completed
- On branch `chore/gather-dotfiles` from `main`, updated `README.md` to document the macOS rice: repository layout, safe rsync dry-run/apply with backups, prerequisites, Aerospace vs yabai+skhd choice, TPM/Neovim first run, machine-specific paths, troubleshooting, and exclusions.
- Verification passed: `git diff --check`; all documented key paths exist; the documented rsync dry-run completed without writing.

## Next recommended step
- Review, commit, and push `README.md` and this handoff; do not claim merge or remote CI success.

## Decisions
- Keep the README focused on safe, adaptable macOS-rice setup guidance rather than adding an installer or pinned package list.

## Open risks or blockers
- `.tmux.conf` source home path is a symlink, while the repository copy is a regular matching-content file.
- The README change is not committed or pushed yet.

## Resume prompt
- Review the README and handoff on `chore/gather-dotfiles`, then commit and push both; verify remote CI separately.
