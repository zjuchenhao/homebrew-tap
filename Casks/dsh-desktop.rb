cask "dsh-desktop" do
  version "2.0.5"

  url "https://github.com/anywhere-labs/dsh-desktop/releases/download/v#{version}/DSH.Desktop-#{version}-universal.dmg",
      verified: "github.com/anywhere-labs/dsh-desktop/"
  sha256 "3ab20c4d05c23ce08af5c6d5c8944eac24555278c9673a650d31603a57abd9b9"

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
