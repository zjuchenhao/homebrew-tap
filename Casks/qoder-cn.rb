cask "qoder-cn" do
  version "1.35.0"

  on_arm do
    url "https://qoder-ide-cn.oss-cn-hangzhou.aliyuncs.com/qoder/release/#{version}/Qoder-CN-IDE-darwin-arm64.dmg"
    sha256 "bdd4d481a61a7c0e0e5b67f2e6e06931ab20908ac69c38d8db9f527d5ecfee82"
  end
  on_intel do
    url "https://qoder-ide-cn.oss-cn-hangzhou.aliyuncs.com/qoder/release/#{version}/Qoder-CN-IDE-darwin-x64.dmg"
    sha256 "5b670dc827ceaad0457b4b68fe4a7439cfc5541b56e7f738a182ca90aae26430"
  end

  name "Qoder CN IDE"
  desc "Agentic AI coding IDE"
  homepage "https://qoder.cn/"

  livecheck do
    url "https://docs.qoder.cn/product-overview/qoder-cn-ide-update-log"
    strategy :page_match do |page|
      page.scan(/data-component-part="update-description">\s*v?(\d+(?:\.\d+)+)/i).flatten.first
    end
  end

  auto_updates true

  depends_on macos: :monterey

  app "Qoder CN IDE.app"

  uninstall quit: "com.aliyun.lingma.ide"

  zap trash: [
    "~/.qoder-cn",
    "~/.qodercn",
    "~/Library/Application Support/QoderCN",
    "~/Library/Caches/QoderCN",
    "~/Library/Caches/com.aliyun.lingma.ide",
    "~/Library/HTTPStorages/com.aliyun.lingma.ide",
    "~/Library/Logs/QoderCN",
    "~/Library/Preferences/com.aliyun.lingma.ide.plist",
    "~/Library/Saved Application State/com.aliyun.lingma.ide.savedState",
  ]
end
