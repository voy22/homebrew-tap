cask "pejava-commander" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "e667e919e4182c0f6439b16625d74a84db360b5ba93d8c2e4769dfafc99afaa0",
         intel: "ef32696320e59a1ecb4bb1c136586cc6960f2b793af46079d8c1b7d4ecd149e8"

  url "https://pejava.com/dl/v#{version}/PejavaCommander-#{version}-#{arch}.dmg"
  name "PejavaCommander"
  desc "Two-panel file manager where everything is a plugin"
  homepage "https://pejava.com/"

  livecheck do
    url "https://pejava.com/dl/latest?os=mac&arch=#{arch}"
    regex(/PejavaCommander[._-]v?(\d+(?:\.\d+)+)[._-]/i)
    strategy :header_match
  end

  depends_on macos: ">= :monterey"

  app "PejavaCommander.app"

  # The preview builds are not notarized yet: without this, macOS refuses to
  # open the app the first time.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PejavaCommander.app"]
  end

  zap trash: [
    "~/Library/Application Support/PejavaCommander",
    "~/Library/Caches/com.pejava.commander",
    "~/Library/Caches/com.pejava.commander.ShipIt",
    "~/Library/Preferences/com.pejava.commander.plist",
    "~/Library/Saved Application State/com.pejava.commander.savedState",
  ]
end
