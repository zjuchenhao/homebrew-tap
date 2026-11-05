cask "kimi-code-app" do
  version "1.3.1"

  on_arm do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-arm64.dmg"
    sha256 "38c19118d8d42243fb3d0603570e2a95490193ac5f4083c64f258a77d36a4cbf"
  end
  on_intel do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-x64.dmg"
    sha256 "611fac78172db07f74d95424335689164904baa9f104c1a1bc7caa40d2d2b270"
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
