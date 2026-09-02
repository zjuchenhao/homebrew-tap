cask "token-monitor" do
  version "0.52.0"

  on_arm do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-arm64.dmg"
    sha256 "cf6d678958d02ccccd5f2037951647094ffb63546041151fc119c9d3a3fa7394"
  end
  on_intel do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-x64.dmg"
    sha256 "6ee22958625017fa267a4ca3f98a1c76c2c2d1d2570173411ea7134a222d3ce0"
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
