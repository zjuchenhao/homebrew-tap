cask "pi-desktop" do
  version "0.14.5"

  on_arm do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-arm64-mac.zip"
    sha256 "f63c19f4e8b21def67d8361a9b41d79695ce44389d32ba9fc597ddc0bc60a096"
  end
  on_intel do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-mac.zip"
    sha256 "2ed8462ef57a2a1549ef2249147ab40ef6eed5b5d801346df27cb9b01d7f3ec9"
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
