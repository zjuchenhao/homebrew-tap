cask "token-monitor" do
  version "0.68.0"

  on_arm do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-arm64.dmg"
    sha256 "bb08ea475bc230cedc4cd95791ed733270840279149c52178a5661e4a4417b8e"
  end
  on_intel do
    url "https://github.com/Javis603/token-monitor/releases/download/v#{version}/Token-Monitor-#{version}-x64.dmg"
    sha256 "3c39d644ab46a88faa71ed89f870430ceb89a96a753cd236b673202bbbbd900b"
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
