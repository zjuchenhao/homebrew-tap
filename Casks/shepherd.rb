cask "shepherd" do
  version "1.3.8"
  sha256 "edcd0f3ae466e2025b4371d77936a704c269806121feb4e37948bc448deef620"

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
