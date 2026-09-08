cask "pi-desktop" do
  version "0.14.2"

  on_arm do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-arm64-mac.zip"
    sha256 "d0a78d353da5c292c28da469aa2f877f7003c30caeb20e5a45241370f2f38f0c"
  end
  on_intel do
    url "https://github.com/vastsa/PI-Desktop/releases/download/v#{version}/PI-Desktop-#{version}-mac.zip"
    sha256 "12ee3229f11496c79c35f5371125908c2104386bf6172eb3034d8060c9acb311"
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
