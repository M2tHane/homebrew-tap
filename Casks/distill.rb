cask "distill" do
  version "0.1.0"
  sha256 "fdf7e9d8ef2450703bfad517cd90fb8074b9ec304065f48317e435edbaf88838"

  url "https://github.com/M2tHane/Distill/releases/download/v#{version}/Distill-#{version}.zip"
  name "Distill"
  desc "Distill coding agent sessions into skills, rules and AGENTS.md"
  homepage "https://github.com/M2tHane/Distill"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Distill.app"

  # The app is signed ad hoc, not by a Developer ID, so Gatekeeper would
  # refuse to open it while it is quarantined.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Distill.app"]
  end

  zap trash: "~/.distill"
end
