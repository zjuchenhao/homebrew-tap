cask "shepherd" do
  version "1.3.10"
  sha256 "06420cf505527c2a6c1dc460263aad3ced6ad3bc5732362e9153ae44de716ffd"

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
