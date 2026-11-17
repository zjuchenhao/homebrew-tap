cask "qoder-cn" do
  version "0.5.14"

  on_arm do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-arm64.zip"
    sha256 "71a7e393e566be4d9f582dd0366e8b10eafe2c97c58761b87663ba5531caa7b5"
  end
  on_intel do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-x64.zip"
    sha256 "a93892ff2cbf7cf8dc06b89e4d5babf05985ded7545d555e181ead35d6ceda40"
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
