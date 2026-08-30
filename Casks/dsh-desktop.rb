cask "dsh-desktop" do
  version "2.0.4"

  url "https://github.com/anywhere-labs/dsh-desktop/releases/download/v#{version}/DSH.Desktop-#{version}-universal.dmg",
      verified: "github.com/anywhere-labs/dsh-desktop/"
  sha256 "4b89bfe2794d8ac3248f09c78ac54f16f92cda40e3c7e2da7d1708a3b4ba7a33"

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
