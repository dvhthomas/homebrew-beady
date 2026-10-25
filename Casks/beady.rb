cask "beady" do
  version "0.2.1"
  sha256 "a30b07260643ab64fdb0b2367aeb3f9e2dd8d890e9d4bad4c37a4bd7526cb01d"

  url "https://github.com/dvhthomas/beady/releases/download/v#{version}/Beady-#{version}.zip"
  name "Beady"
  desc "Window onto a beads (bd) issue database"
  homepage "https://github.com/dvhthomas/beady"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Beady.app"

  zap trash: [
    "~/Library/Application Support/Beady",
    "~/Library/Preferences/me.bitsby.beady.plist",
    "~/Library/Saved Application State/me.bitsby.beady.savedState",
  ]

  caveats do
    <<~EOS
      Beady is ad-hoc signed but not notarised (there is no Apple Developer ID
      behind it), so macOS quarantines the download. The first launch is refused;
      System Settings > Privacy & Security then offers "Open Anyway", and that
      approval is kept across upgrades. To clear the flag yourself instead:

        xattr -dr com.apple.quarantine "#{appdir}/Beady.app"

      Beady drives bd, which it looks for on PATH and in Homebrew's bin:

        brew install beads
    EOS
  end
end
