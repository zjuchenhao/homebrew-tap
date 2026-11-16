cask "qoder-cn" do
  version "0.5.13"

  on_arm do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-arm64.zip"
    sha256 "3d64d3ac4594e96ce74391bd2c83114750726e43eb7703ecaa2ae7d565440c8e"
  end
  on_intel do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-x64.zip"
    sha256 "79f54efee501118a121c362e0e88fc532f0274fbc77f144d6180749aa775acfd"
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
