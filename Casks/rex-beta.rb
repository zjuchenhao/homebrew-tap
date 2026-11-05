cask "rex-beta" do
  version "0.1.0,1829"

  # Preview channel. `.../preview/latest.dmg` is the same artifact as this
  # versioned file (identical bytes/sha256), but only the versioned URL is
  # immutable, so pin to it and let `livecheck` find new builds.
  url "https://blob.superlogical.com/public/rex-app/preview/Rex-#{version.csv.first}-#{version.csv.second}.dmg"
  sha256 "f8b00989f7e55c4dfacbc1a8e576bf44880498491c7924cc9c84a13caadbbf49"

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
