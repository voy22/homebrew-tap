cask "pejava-dock" do
  version "0.3.7"
  sha256 "43d01048bc8112ea9d66c52861b937147c680399afd40a97d917940f50d6e9e4"

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
