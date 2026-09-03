cask "token-monitor" do
  version "0.53.0"

  on_arm do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-arm64.dmg"
    sha256 "d5c9950305cb5acb658877308d9a3078d0f911ae68d5eedafdeeaacb8207f084"
  end
  on_intel do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-x64.dmg"
    sha256 "bb2ce64240813e59506d46d31700c39fac9e7f21138894947b81dd48ffe65295"
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
