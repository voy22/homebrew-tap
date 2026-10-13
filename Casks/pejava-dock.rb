cask "pejava-dock" do
  version "0.3.1"
  sha256 "a01e2475614ed8210f81f6833f768a31a85a33255db0423a582b445b595a50d1"

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
