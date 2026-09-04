cask "clashmac" do
  version "27.1.3"

  url "https://github.com/666OS/ClashMac/releases/download/#{version}/ClashMac-#{version}.dmg",
      verified: "github.com/666OS/ClashMac/"
  sha256 "aea7ff42f9aa7fa311ad9e6da92a47f7e11033c43ef59ff8b516b4592c67b24d"

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