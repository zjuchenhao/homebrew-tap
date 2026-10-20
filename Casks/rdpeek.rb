cask "rdpeek" do
  version "1.1.1"

  url "https://github.com/steelbrain/RDPeek/releases/download/v#{version}/RDPeek.zip"
  sha256 "69d713ec60c1d9f8f41460592ed9317173b7e7b3c23a837ce91f9319c431b212"

  name "RDPeek"
  desc "Native RDP client for macOS"
  homepage "https://github.com/steelbrain/RDPeek"

  livecheck do
    url "https://github.com/steelbrain/RDPeek/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "RDPeek.app"

  zap trash: [
    "~/Library/Caches/ai.aneesiqbal.rdpeek",
    "~/Library/HTTPStorages/ai.aneesiqbal.rdpeek",
    "~/Library/Preferences/ai.aneesiqbal.rdpeek.plist",
    "~/Library/Saved Application State/ai.aneesiqbal.rdpeek.savedState",
  ]
end
