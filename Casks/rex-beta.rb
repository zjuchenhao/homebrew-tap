cask "rex-beta" do
  version "0.1.0,1696"

  # Preview channel. `.../preview/latest.dmg` is the same artifact as this
  # versioned file (identical bytes/sha256), but only the versioned URL is
  # immutable, so pin to it and let `livecheck` find new builds.
  url "https://blob.superlogical.com/public/rex-app/preview/Rex-#{version.csv.first}-#{version.csv.second}.dmg"
  sha256 "b192116cfe93fc8f9cf23b4ab0b77ad037c952a2bdd9a4ecff1882db426bbf8f"

  name "Rex Beta"
  desc "Terminal multiplexer and workspace for coding agents (beta channel)"
  homepage "https://superlogical.com/rex"

  livecheck do
    # Public Sparkle appcast for the preview channel (no login needed, unlike
    # the /download/ URLs). Beta builds keep the same short version and only
    # bump the build number, so combine both: "0.1.0,1642".
    url "https://blob.superlogical.com/public/rex-app/preview/appcast.xml"
    strategy :sparkle do |item|
      "#{item.short_version},#{item.version}"
    end
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Rex Beta.app"

  uninstall quit: "com.superlogical.rex"

  zap trash: [
    "~/.config/rex",
    "~/.rex",
    "~/Library/Application Support/com.superlogical.rex",
    "~/Library/Caches/com.superlogical.rex",
    "~/Library/HTTPStorages/com.superlogical.rex",
    "~/Library/Preferences/com.superlogical.rex.plist",
    "~/Library/Saved Application State/com.superlogical.rex.savedState",
    "~/Library/WebKit/com.superlogical.rex",
  ]
end
