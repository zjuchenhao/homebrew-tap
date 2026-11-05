cask "qoder-cn" do
  version "0.5.5"

  on_arm do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-arm64.zip"
    sha256 "5c60d5f68ef4e03ed671ca0d47b84a68234dd88366701ec16d040525155d0214"
  end
  on_intel do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-x64.zip"
    sha256 "ed6edfcc7c2c787bae03daea910431ce52b65ee25911407c99cda25d3ec08689"
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
