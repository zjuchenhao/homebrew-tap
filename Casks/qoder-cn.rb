cask "qoder-cn" do
  version "0.5.3"

  on_arm do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-arm64.zip"
    sha256 "079cb1b2823bb81a0069dd8d06cdb993b5f33077eb631dee58c13fdd36be5b1c"
  end
  on_intel do
    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-x64.zip"
    sha256 "f013ec36c7a226a513231828b94eea667ddaea67f2b37b869392d9a694e478c2"
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
