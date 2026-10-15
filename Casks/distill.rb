cask "distill" do
  version "0.2.0"
  sha256 "b26e23bced5449c4fd23966859af66a2c6b7b98d79e1d44adf701302db14ed09"

  url "https://github.com/M2tHane/Distill/releases/download/v#{version}/Distill-#{version}.zip"
  name "Distill"
  desc "Turn coding agent sessions into skills, rules and AGENTS.md"
  homepage "https://github.com/M2tHane/Distill"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Distill.app"

  # Distill is signed ad hoc, not with a Developer ID, so Gatekeeper refuses
  # to open it while it is quarantined.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Distill.app"]
  end

  zap trash: "~/.distill"
end
