cask "atom-beta" do
  version "1.60.0-beta0"
  sha256 "91db16eca1cd7a4bc6a076074b190249190fddf0d8de3435e084cdd62e5c99fe"

  url "https://github.com/atom/atom/releases/download/v#{version}/atom-mac.zip",
      verified: "github.com/atom/atom/"
  name "Github Atom Beta"
  desc "Cross-platform text editor"
  homepage "https://atom.io/beta"

  livecheck do
    url :url
    strategy :git
    regex(/^v?(\d+(?:\.\d+)*-beta\d*)$/i)
  end

  auto_updates true

  app "Atom Beta.app"
  binary "#{appdir}/Atom Beta.app/Contents/Resources/app/apm/bin/apm", target: "apm-beta"
  binary "#{appdir}/Atom Beta.app/Contents/Resources/app/atom.sh", target: "atom-beta"

  zap trash: [
    "~/.atom",
    "~/Library/Application Support/Atom",
    "~/Library/Application Support/ShipIt_stderr.log",
    "~/Library/Application Support/ShipIt_stdout.log",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.github.atom.sfl*",
    "~/Library/Application Support/com.github.atom.ShipIt",
    "~/Library/Caches/com.github.atom",
    "~/Library/Caches/com.github.atom.ShipIt",
    "~/Library/Logs/Atom",
    "~/Library/Preferences/com.github.atom.helper.plist",
    "~/Library/Preferences/com.github.atom.plist",
    "~/Library/Saved Application State/com.github.atom.savedState",
  ]
end
