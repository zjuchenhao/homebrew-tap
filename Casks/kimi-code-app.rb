cask "kimi-code-app" do
  version "1.0.0"

  on_arm do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-arm64.dmg"
    sha256 "22e556e56a624206b2ebc995b6dae1c601f32273d9d854ae33dc5785f792e8f0"
  end
  on_intel do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-x64.dmg"
    sha256 "b87c064cd70437874fab9c41a18703f7d971f052495d5bd3e2e6832c6fd660dc"
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
