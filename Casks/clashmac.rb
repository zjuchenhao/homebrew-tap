cask "clashmac" do
  version "27.1.9"

  url "https://github.com/666OS/ClashMac/releases/download/#{version}/ClashMac-#{version}.dmg"
  sha256 "cc91a280cada2dded0045d2aedef86cd21320b462351fa2a06abbe83a822ff14"

  name "ClashMac"
  desc "Native proxy client for macOS"
  homepage "https://clashmac.app/"

  livecheck do
    url "https://github.com/666OS/ClashMac/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "ClashMac.app"
end