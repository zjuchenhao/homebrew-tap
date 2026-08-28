cask "clashmac" do
  version "27.1.2"

  url "https://github.com/666OS/ClashMac/releases/download/#{version}/ClashMac-#{version}.dmg",
      verified: "github.com/666OS/ClashMac/"
  sha256 "de283f7da56019f728a7d70405bf2d8c23680f9a5536cae3e0bbb2f29a8c169e"

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