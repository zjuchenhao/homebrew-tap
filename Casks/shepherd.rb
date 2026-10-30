cask "shepherd" do
  version "1.3.9"
  sha256 "d2294723bebb45f4460de7ea2c29f9c871b16c18293447626bbab1cca887e6f5"

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
