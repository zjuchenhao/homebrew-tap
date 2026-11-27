cask "qoder-cn" do
  version "0.5.21"

  on_arm do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-arm64.zip"
    sha256 "dde2f66eff2c1d45a114aba0dc6e26fb49134a7b13f0bf53f12c30b2fdcf1a8b"
  end
  on_intel do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-x64.zip"
    sha256 "2ebe0c2faf348ccbfa61753d9d84a5209955ee382c2bdd5c05e73526db1afd39"
  end

  name "Qoder CN"
  desc "Agent workbench for human and AI software teams"
  homepage "https://qoder.cn/"

  livecheck do
    url "https://static.qoder.com.cn/qoder-app/releases/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true

  depends_on macos: :monterey

  app "Qoder CN.app"

  uninstall quit: "com.qodercn.app"

  zap trash: [
    "~/.qoder",
    "~/Library/Application Support/Qoder CN",
    "~/Library/Application Support/qoder-cn",
    "~/Library/Caches/com.qodercn.app",
    "~/Library/Caches/qoder-cn-updater",
    "~/Library/HTTPStorages/com.qodercn.app",
    "~/Library/Logs/Qoder CN",
    "~/Library/Preferences/com.qodercn.app.plist",
    "~/Library/Saved Application State/com.qodercn.app.savedState",
    "~/Library/WebKit/com.qodercn.app",
  ]
end
