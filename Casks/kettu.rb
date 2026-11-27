cask "kettu" do
  version "0.1.30"

  on_arm do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-arm64.dmg"
    sha256 "89bc7c2c3e7e91744eb99a2160d1b3f31052d027b721da4ccafd0996499d8d88"
  end
  on_intel do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-x64.dmg"
    sha256 "076bfabc6d33792815461aa98d9a63ffddd093add5e3cd4a3ad37abd970e3a18"
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
