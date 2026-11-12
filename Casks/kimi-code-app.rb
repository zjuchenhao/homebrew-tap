cask "kimi-code-app" do
  version "1.3.5"

  on_arm do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-arm64.dmg"
    sha256 "0566d55128000736569a6a44eef0ff116c69a68f9471f243aa81c453dadfcbe0"
  end
  on_intel do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-x64.dmg"
    sha256 "d6d1fa478c875661a1b7f6f124c78edc7b2c5a630dac54a5f524f83cb6fd4be9"
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
