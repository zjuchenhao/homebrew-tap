cask "kettu" do
  version "0.1.27"

  on_arm do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-arm64.dmg"
    sha256 "f63af124819cff5a7d07eba187e2e297addd40c1c173780ae38b45fca9501901"
  end
  on_intel do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-x64.dmg"
    sha256 "d4423a0c2c73bae096b8505eb2bdb22f66021e11bff58ba3e667dfe392a8315c"
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
