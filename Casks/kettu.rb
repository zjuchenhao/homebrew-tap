cask "kettu" do
  version "0.1.33"

  on_arm do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-arm64.dmg"
    sha256 "ef28e74016f15c9110eec963f0cdd21d17fd29d15af6e26d3e396c21f82d29f4"
  end
  on_intel do
    url "https://github.com/KettuAI/Kettu/releases/download/v#{version}/Kettu-#{version}-x64.dmg"
    sha256 "c33a7a21c74e49305ecdd5b88ec43dedcb009607e69c92863aa39c624187c65b"
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
