cask "qoder-cn" do
  version "1.34.0"

  on_arm do
    url "https://qoder-ide-cn.oss-cn-hangzhou.aliyuncs.com/qoder/release/#{version}/Qoder-CN-IDE-darwin-arm64.dmg"
    sha256 "3d036062ce392eac48c48a1c539a31f8188cf44abcac94e616575fdb9b9546ce"
  end
  on_intel do
    url "https://qoder-ide-cn.oss-cn-hangzhou.aliyuncs.com/qoder/release/#{version}/Qoder-CN-IDE-darwin-x64.dmg"
    sha256 "7bcbaf96af7db132bde9396174c17a1162a2726ebda19bd66c9e26bada46421d"
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
