cask "clashmac" do
  version "27.1.8"

  url "https://github.com/666OS/ClashMac/releases/download/#{version}/ClashMac-#{version}.dmg"
  sha256 "d48a0bcac1fe97e2cb06bf99541fba71e0f6e0060d954fbee8898ad268c508f9"

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