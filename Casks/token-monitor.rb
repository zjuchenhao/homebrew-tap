cask "token-monitor" do
  version "0.65.0"

  on_arm do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-arm64.dmg"
    sha256 "da42738ecf35c78b126cb767debc69b6138be44ed1f641580e8886aa3aefde9a"
  end
  on_intel do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-x64.dmg"
    sha256 "24f959f6fe2c0c7a28b2fa7ce284573ac5af284eb72c39ba55429cabd4333aff"
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
