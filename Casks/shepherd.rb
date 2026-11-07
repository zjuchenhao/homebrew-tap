cask "shepherd" do
  version "1.7.1"
  sha256 "aa5a4e9da614157f6b4e03711e46d96c559d86fec221c9dc5d72e8c30d002714"

  url "https://github.com/freethinkel/shepherd/releases/download/v#{version}/Shepherd-#{version}-universal.dmg"
  name "Shepherd"
  desc "Native herdr client for running Claude Code and Codex agents side by side"
  homepage "https://github.com/freethinkel/shepherd"

  livecheck do
    url "https://github.com/freethinkel/shepherd/releases/latest"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Shepherd.app"

  uninstall quit: "dev.freethinkel.shepherd"

  zap trash: [
    "~/Library/Application Support/Shepherd",
    "~/Library/Caches/Shepherd",
    "~/Library/HTTPStorages/dev.freethinkel.shepherd",
    "~/Library/Preferences/dev.freethinkel.shepherd.plist",
    "~/Library/Saved Application State/dev.freethinkel.shepherd.savedState",
    "~/Library/WebKit/dev.freethinkel.shepherd",
  ]
end
