cask "pejava-dock" do
  version "0.3.8"
  sha256 "92fd2720e8674fc2760e8fc58dd64e51a889938ba5b59a521908c6a17ff8691f"

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
