cask "kettu" do
  version "0.1.28"

  on_arm do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-arm64.dmg"
    sha256 "2a8b25e382fb8a5028d14e78359c4de17f7afded2d331eacba6c524e3cb3af19"
  end
  on_intel do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-x64.dmg"
    sha256 "bdfd6f04a4011faa57d67f5722d55c064c232a05139e2fe2a9ab46bb664dfdd7"
  end

  name "Kettu"
  desc "Desktop workbench for terminal coding agents"
  homepage "https://www.kettu.sh/"

  livecheck do
    url "https://github.com/KettuAI/Kettu/releases/latest/download/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :ventura

  app "Kettu.app"

  uninstall quit: "sh.kettu.app"

  zap trash: [
    "~/Library/Application Support/Kettu",
    "~/Library/Caches/kettu-updater",
    "~/Library/Caches/sh.kettu.app",
    "~/Library/HTTPStorages/sh.kettu.app",
    "~/Library/Logs/Kettu",
    "~/Library/Preferences/sh.kettu.app.plist",
    "~/Library/Saved Application State/sh.kettu.app.savedState",
  ]
end
