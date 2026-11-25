cask "kettu" do
  version "0.1.22"

  on_arm do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-arm64.dmg"
    sha256 "098cb08622f3f53ecb16a717764d9995e8ca194ddcb4b090c806221a35cd1412"
  end
  on_intel do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-x64.dmg"
    sha256 "77151cafd0eb88fc4d442018cb817d61c42adb5090c9823303c4667d46382826"
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
