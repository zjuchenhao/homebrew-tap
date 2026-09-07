cask "pi-desktop" do
  version "0.14.0"

  on_arm do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-arm64-mac.zip"
    sha256 "a59951755be618ad14c8858e4cd148fad797fb98b58ae1e6d5bdb96612fcdf06"
  end
  on_intel do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-mac.zip"
    sha256 "2a4040c0e814b10064fd32c752befbb36a0a683123e2db6da1c246a6d988ea85"
  end

  name "PI-Desktop"
  desc "Local-first AI coding agent desktop with a Rust host core and installable plugins"
  homepage "https://github.com/vastsa/PI-Desktop"

  livecheck do
    url "https://github.com/vastsa/PI-Desktop/releases/latest/download/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "PI-Desktop.app"

  zap trash: [
    "~/.pi-desktop",
    "~/Library/Application Support/PI-Desktop",
    "~/Library/Caches/PI-Desktop",
    "~/Library/HTTPStorages/com.pi-desktop.app",
    "~/Library/Logs/PI-Desktop",
    "~/Library/Preferences/com.pi-desktop.app.plist",
    "~/Library/Saved Application State/com.pi-desktop.app.savedState",
  ]
end
