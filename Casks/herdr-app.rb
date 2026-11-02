cask "herdr-app" do
  version "0.1.11"

  url "https://releases.herdr.dev/app/#{version}/Herdr.dmg"
  sha256 "e918204612d0ad0266f476acdcf7b217c34d0d7e1c8ace22a37b2df2bf20eafb"

  name "Herdr"
  desc "Native workspace for coding agents that keep running in the background"
  homepage "https://herdr.dev/"

  livecheck do
    # No GitHub releases or appcast; the release server publishes a manifest
    # whose `version` matches the app bundle version.
    # `https://releases.herdr.dev/app/#{version}/Herdr.dmg` is the same artifact
    # as the unversioned `https://releases.herdr.dev/app/Herdr.dmg`.
    url "https://releases.herdr.dev/app/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Herdr.app"

  uninstall quit: "dev.herdr.app"

  zap trash: [
    "~/.config/herdr-app",
    "~/Library/Application Support/herdr-app",
    "~/Library/Caches/dev.herdr.app",
    "~/Library/Preferences/dev.herdr.app.plist",
    "~/Library/Saved Application State/dev.herdr.app.savedState",
  ]
end
