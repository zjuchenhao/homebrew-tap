cask "herdr" do
  version "0.1.10"

  url "https://releases.herdr.dev/app/#{version}/Herdr.dmg"
  sha256 "08be7b314e00dc3926df12616a1a0b4464771ff3bd0916c41a26d7d921ca3556"

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
