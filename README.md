# Homebrew tap for Beady

[Beady](https://github.com/dvhthomas/beady) is a native macOS window onto a [beads](https://github.com/gastownhall/beads) (`bd`) issue database.

```bash
brew install --cask dvhthomas/beady/beady
```

The app is ad-hoc signed but not notarised, so macOS quarantines it: open it once and choose **Open Anyway** in System Settings → Privacy & Security. Beady needs `bd` on your PATH (`brew install beads`).

`Casks/beady.rb` is written by Beady's release workflow on every tagged release; nothing here is edited by hand.
