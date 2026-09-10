cask "token-monitor" do
  version "0.55.0"

  on_arm do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-arm64.dmg"
    sha256 "5526e22a8faa8ab29a8091bd187ee9359bafb3fe5822c6d18ebc6c6792a8b9d7"
  end
  on_intel do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-x64.dmg"
    sha256 "92c27c756d691d6556bf9ca8eeecc3580c5cbc9ba4a90ab49426af3f92a699db"
  end

  name "Token Monitor"
  desc "Local-first desktop widget for tracking token usage, costs, and limits across AI coding tools"
  homepage "http://javis-ai.com/token-monitor/"

  livecheck do
    url "https://github.com/Javis603/token-monitor/releases/latest/download/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true

  app "Token Monitor.app"

  zap trash: [
    "~/Library/Application Support/Token Monitor",
    "~/Library/Caches/com.javis.tokenmonitor",
    "~/Library/HTTPStorages/com.javis.tokenmonitor",
    "~/Library/Logs/Token Monitor",
    "~/Library/Preferences/com.javis.tokenmonitor.plist",
    "~/Library/Saved Application State/com.javis.tokenmonitor.savedState",
  ]
end
