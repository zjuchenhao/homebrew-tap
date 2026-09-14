cask "ima-copilot" do
  version "2.6.10,5128"

  url "https://app-dl.ima.qq.com/mac_channel/ima.copilot_universal_1018_#{version.csv.first}_#{version.csv.second}.dmg"
  sha256 "894615b7d613eadd8efa01b179970c5716018c96e42b0bbdfa9b1f8a18a0f4aa"

  name "ima.copilot"
  desc "AI-powered knowledge base and productivity workspace"
  homepage "https://ima.qq.com/"

  livecheck do
    url "https://ima.qq.com/cgi-bin/fe_config_proxy/get_rainbow_config",
        post_json: {
          group: "ima-download-config",
          key:   "download-config",
        }
    strategy :json do |json|
      config = JSON.parse(json["value"])
      download_url = config.dig("official", "mac", "url")
      match = download_url&.match(%r{_(\d+(?:\.\d+)+)_(\d+)\.dmg\z}i)
      next unless match

      "#{match[1]},#{match[2]}"
    end
  end

  auto_updates true

  depends_on macos: :monterey

  app "ima.copilot.app"

  zap trash: [
    "~/Library/Application Support/ima.copilot",
    "~/Library/Caches/com.tencent.imamac",
    "~/Library/HTTPStorages/com.tencent.imamac",
    "~/Library/Preferences/com.tencent.imamac.plist",
    "~/Library/Saved Application State/com.tencent.imamac.savedState",
  ]
end
