cask "clashmac" do
  version "27.1.6"

  url "https://github.com/666OS/ClashMac/releases/download/#{version}/ClashMac-#{version}.dmg"
  sha256 "6d9a6b6aad84da104ba0261c50add13d1a1b48578f4345721b946a15c273ce2f"

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