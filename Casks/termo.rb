cask "termo" do
  version "1.1.0"
  sha256 "080f690e43cc509e086715371a641fadab4e954ae3d16e4890c6c7b6161708c4"

  url "https://github.com/icloudza/termo/releases/download/v#{version}/Termo-#{version}.dmg"
  name "Termo"
  desc "Native remote workbench for SSH, SFTP, RDP, and port forwarding"
  homepage "https://termoi.app"

  livecheck do
    url "https://icloudza.github.io/termo/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Termo.app"

  uninstall quit: "com.cloudza.termo"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.cloudza.termo.sfl*",
    "~/Library/Application Support/termo",
    "~/Library/Caches/com.cloudza.termo",
    "~/Library/HTTPStorages/com.cloudza.termo",
    "~/Library/Preferences/com.cloudza.termo.plist",
    "~/Library/Saved Application State/com.cloudza.termo.savedState",
    "~/Library/WebKit/com.cloudza.termo",
  ]
end
