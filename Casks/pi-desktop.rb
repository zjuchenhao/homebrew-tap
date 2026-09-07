cask "pi-desktop" do
  version "0.14.1"

  on_arm do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-arm64-mac.zip"
    sha256 "e84de5de5e5c2bc2029ec314e42b2109e9c08c40d2f29a55961dc2c93c1b33a0"
  end
  on_intel do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-mac.zip"
    sha256 "142c52c46731725e8d4e60e9e22b3f1dddab69f901bcc6be85022d77b0bbf350"
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
