cask "kimi-code-app" do
  version "1.0.2"

  on_arm do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-arm64.dmg"
    sha256 "868e9e419508fbc8c0d0744aac3cb7ce06bde028546b64c9444dc992c753435e"
  end
  on_intel do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-x64.dmg"
    sha256 "6c380e63a9c91921171a20385653778c937de5e0de2509f883959c41319c6560"
  end

  name "Kimi Code"
  desc "AI coding agent desktop app from Kimi"
  homepage "https://www.kimi.com/"

  livecheck do
    url "https://cdn.kimi.com/kimi-code/desktop/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true

  app "Kimi Code.app"

  zap trash: [
    "~/Library/Application Support/Kimi Code",
    "~/Library/Caches/com.kimi.code.desktop",
    "~/Library/HTTPStorages/com.kimi.code.desktop",
    "~/Library/Preferences/com.kimi.code.desktop.plist",
    "~/Library/Saved Application State/com.kimi.code.desktop.savedState",
  ]
end
