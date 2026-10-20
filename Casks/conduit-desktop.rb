cask "conduit-desktop" do
  version "0.18.3"

  url "https://github.com/advenimus/conduit-desktop/releases/download/v#{version}/Conduit-#{version}-arm64.dmg"
  sha256 "af76bcba77c2a7584e71e2bc0ae0c655eccf00bdd6bf8ed922ae3fd37c378446"

  name "Conduit"
  desc "Remote connection manager for SSH, RDP, VNC and web sessions with MCP support"
  homepage "https://conduitdesktop.com/"

  livecheck do
    url "https://github.com/advenimus/conduit-desktop/releases/latest/download/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Conduit #{version}-arm64/Conduit.app"

  uninstall quit: "com.conduit.app"

  zap trash: [
    "~/Library/Application Support/conduit",
    "~/Library/Caches/com.conduit.app",
    "~/Library/HTTPStorages/com.conduit.app",
    "~/Library/Logs/Conduit",
    "~/Library/Preferences/com.conduit.app.plist",
    "~/Library/Saved Application State/com.conduit.app.savedState",
  ]
end
