cask "flockbook" do
  version "0.6.1"
  sha256 "5ab0c1db3c9b1e3181c22ae9554d25c01e3ba161a731e3615443826bdb1bd513"

  url "https://github.com/minchenlee/flockbook/releases/download/v#{version}/Flockbook-#{version}.dmg"
  name "Flockbook"
  desc "Reading view and reply client for Herdr coding agents"
  homepage "https://github.com/minchenlee/flockbook"

  livecheck do
    url "https://github.com/minchenlee/flockbook/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Flockbook.app"

  uninstall quit: "dev.mclee.flockbook"

  zap trash: [
    "~/Library/Application Support/Flockbook",
    "~/Library/Caches/Flockbook",
    "~/Library/Caches/dev.mclee.flockbook",
    "~/Library/HTTPStorages/dev.mclee.flockbook",
    "~/Library/Preferences/dev.mclee.flockbook.plist",
    "~/Library/Saved Application State/dev.mclee.flockbook.savedState",
    "~/Library/WebKit/dev.mclee.flockbook",
  ]
end
