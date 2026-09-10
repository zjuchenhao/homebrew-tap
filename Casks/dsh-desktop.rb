cask "dsh-desktop" do
  version "2.0.9"

  url "https://github.com/anywhere-labs/dsh-desktop/releases/download/v#{version}/DSH.Desktop-#{version}-universal.dmg"
  sha256 "ebe2ced61b850a919f73dde93a579ffe357fa8f800ee833b9c8f0448ab719dda"

  name "DSH Desktop"
  desc "Open-source desktop client for the DeepSeek Harness (DSH) plugin ecosystem"
  homepage "https://dshdesktop.cn"

  livecheck do
    url "https://github.com/anywhere-labs/dsh-desktop/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "DSH Desktop.app"

  zap trash: [
    "~/Library/Application Support/DSH Desktop",
    "~/Library/Caches/DSH Desktop",
    "~/Library/HTTPStorages/ai.deepseek.dsh.desktop",
    "~/Library/Logs/DSH Desktop",
    "~/Library/Preferences/ai.deepseek.dsh.desktop.plist",
    "~/Library/Saved Application State/ai.deepseek.dsh.desktop.savedState",
  ]
end
