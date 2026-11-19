cask "kimi-code-app" do
  version "1.4.0"

  on_arm do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-arm64.dmg"
    sha256 "188e2cd86167246db587fbdcd8e857bcc251564318a357d70ef32523e8fcc7c4"
  end
  on_intel do
    url "https://cdn.kimi.com/kimi-code/desktop/download/KimiCode-mac-x64.dmg"
    sha256 "532ea3b12fef75ac757832975612b302c5e3e79cf3c4cd688e434157c7db0f7b"
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
