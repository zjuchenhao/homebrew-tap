cask "tokenremain" do
  version "1.4.7,45"

  url "https://github.com/Carstin520/token-remain/releases/download/v#{version.csv.first}/TokenRemain-#{version.csv.first}-#{version.csv.second}.dmg"
  sha256 "92e7e364b08a14a37ab302f18e0a8255f2ec0b7b96094d110055e86d1d199255"

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
