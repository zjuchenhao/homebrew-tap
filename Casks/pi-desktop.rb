cask "pi-desktop" do
  version "0.13.11"

  on_arm do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-arm64-mac.zip"
    sha256 "78eb477a6e1db37329d8d727b49c4de28d10aa357732178ffcac6257e989c22a"
  end
  on_intel do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-mac.zip"
    sha256 "d94ee48c30d32a2d1f6dd97e1150fb40eefefe5adf8b4f2f10d3bf0b7502b091"
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
