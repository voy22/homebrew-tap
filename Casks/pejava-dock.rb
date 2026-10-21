cask "pejava-dock" do
  version "0.3.10"
  sha256 "4bced9d078c0e910eb71e5b44abfba3070e97c2c5f2436a52689d9510817d2a8"

  url "https://dock.pejava.com/dl/v#{version}/PejavaDock-#{version}.dmg"
  name "PejavaDock"
  desc "Alternative Dock: many docks on any edge of any display, groups and web links"
  homepage "https://dock.pejava.com/"

  livecheck do
    url "https://dock.pejava.com/dl/latest"
    regex(/PejavaDock[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
    strategy :header_match
  end

  depends_on macos: :sonoma

  app "PejavaDock.app"

  # Quitting gives the system Dock back its own settings.
  uninstall quit:       "com.pejavadock.PejavaDock",
            login_item: "PejavaDock"

  zap trash: [
    "~/Library/Application Support/PejavaDock",
    "~/Library/Caches/com.pejavadock.PejavaDock",
    "~/Library/HTTPStorages/com.pejavadock.PejavaDock",
    "~/Library/Preferences/com.pejavadock.PejavaDock.plist",
    "~/Library/WebKit/com.pejavadock.PejavaDock",
  ]
end
