cask "tokenremain" do
  version "1.3.8,35"

  url "https://github.com/Carstin520/token-remain/releases/download/v#{version.csv.first}/TokenRemain-#{version.csv.first}-#{version.csv.second}.dmg",
      verified: "github.com/Carstin520/token-remain/"
  sha256 "324beb7bfefea0dd1bc93a59ea86dce65351a63bcf4f2b7a1c72c288a0e8aa6a"

  name "TokenRemain"
  desc "Privacy-first macOS menu bar app for tracking AI coding quotas, reset times, token usage, and costs"
  homepage "https://tokenremain.com"

  livecheck do
    url "https://github.com/Carstin520/token-remain/releases/latest/download/appcast.xml"
    strategy :sparkle do |item|
      # Combine the short version and build number (e.g. "1.3.7,34") so the
      # generic auto-bump workflow can pass the full version to
      # `brew bump-cask-pr --version` (the URL needs the build number).
      "#{item.short_version},#{item.version}"
    end
  end

  auto_updates true

  app "TokenRemain.app"

  zap trash: [
    "~/Library/Application Support/com.jamesli.usagedock",
    "~/Library/Caches/com.jamesli.usagedock",
    "~/Library/Preferences/com.jamesli.usagedock.plist",
  ]
end
