cask "pejava-commander" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "d5c80eb33d15e85eb71fdca67ed67b5a221cf5210ee8634c41ef04ee2fb1d97f",
         intel: "c5c96bb8f6224eb0050f9ff4f940b2c09928a9f70dd7bad89b699c3edec36309"

  url "https://pejava.com/dl/v#{version}/PejavaCommander-#{version}-#{arch}.dmg"
  name "PejavaCommander"
  desc "Two-panel file manager where everything is a plugin"
  homepage "https://pejava.com/"

  livecheck do
    url "https://pejava.com/dl/latest?os=mac&arch=#{arch}"
    regex(/PejavaCommander[._-]v?(\d+(?:\.\d+)+)[._-]/i)
    strategy :header_match
  end

  depends_on macos: :monterey

  app "PejavaCommander.app"

  # The preview builds are not notarized yet: without this, macOS refuses to
  # open the app the first time.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/PejavaCommander.app"]
  end

  zap trash: [
    "~/Library/Application Support/PejavaCommander",
    "~/Library/Caches/com.pejava.commander",
    "~/Library/Caches/com.pejava.commander.ShipIt",
    "~/Library/Preferences/com.pejava.commander.plist",
    "~/Library/Saved Application State/com.pejava.commander.savedState",
  ]
end
