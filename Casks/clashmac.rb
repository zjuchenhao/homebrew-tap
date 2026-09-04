cask "clashmac" do
  version "27.1.4"

  url "https://github.com/666OS/ClashMac/releases/download/#{version}/ClashMac-#{version}.dmg",
      verified: "github.com/666OS/ClashMac/"
  sha256 "09ae706bac6b7962f4132ab5052ab1e172366cff2a19003b3d4bf07d56793528"

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