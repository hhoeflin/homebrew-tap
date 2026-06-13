# Hhoeflin Tap

## How do I install these formulae?

`brew install hhoeflin/tap/<formula>`

Or `brew tap hhoeflin/tap` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "hhoeflin/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Formulae

- `apm` — manage AI coding agent profiles across OpenCode, Claude, Cursor, and Copilot (https://github.com/hhoeflin/agent_profile_manager)
- `grepai` — privacy-first semantic code search CLI (https://github.com/yoanbernabeu/grepai)

## Updating formulae

To bump a formula to a new upstream release (example: `grepai` to `vX.Y.Z`):

1. **Update the formula** (`Formula/<name>.rb`):
   - Bump the version in the `url` and the trailing tag (e.g. `v0.35.0` → `vX.Y.Z`).
   - For source builds, also bump the `version` field if the formula declares one.
   - If using `head`, leave it as `branch: "main"` — no version bump needed.
2. **Recompute the source-tarball sha256**:
   ```sh
   curl -sL "https://github.com/<owner>/<repo>/archive/refs/tags/vX.Y.Z.tar.gz" | shasum -a 256
   ```
   Paste the resulting hex digest into the `sha256` line.
3. **Validate locally**:
   ```sh
   brew style hhoeflin/tap/<name>
   brew audit --strict --new --formula hhoeflin/tap/<name>
   ```
   Both must report clean before pushing. `brew livecheck hhoeflin/tap/<name>` can confirm the new version was detected.
4. **Commit, push, open PR**:
   ```sh
   git checkout -b bump-<name>-<X.Y.Z>
   git add Formula/<name>.rb
   git commit -m "<name> X.Y.Z"
   git push -u origin bump-<name>-<X.Y.Z>
   gh pr create --fill
   ```
   The existing `.github/workflows/tests.yml` runs `brew test-bot` across Ubuntu 22.04, macOS 13, and macOS 15 on the PR.
