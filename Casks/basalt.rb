# Homebrew cask for Basalt, generated per release by scripts/release.sh from
# packaging/homebrew/basalt.rb.in in the (private) basalt repo. Don't edit it in the tap.
cask "basalt" do
  version "0.1.0-alpha.1"
  sha256 "c254e1b265f032e43cd9fedda4c71d2321b94e0591b6c12650f4aa7185eed504"

  url "https://github.com/navalm/homebrew-tap/releases/download/v#{version}/Basalt-#{version}.dmg"
  name "Basalt"
  desc "Local-first personal finance app that keeps your money in plain files"
  homepage "https://github.com/navalm/homebrew-tap"

  depends_on arch: :arm64
  depends_on :macos

  app "Basalt.app"

  # Device-local caches and layout only. Vaults are your own folders and are never touched.
  zap trash: [
    "~/Library/Application Support/Basalt",
    "~/Library/Saved Application State/app.basalt.Basalt.savedState",
  ]

  caveats <<~EOS
    Basalt alpha builds are not signed with an Apple Developer ID, so macOS blocks the
    first launch. To allow it:
      1. Open Basalt once (it will be blocked).
      2. System Settings → Privacy & Security → scroll to "Basalt was blocked" → Open Anyway.
    You only need to do this once per installed version.

    Basalt is alpha software that writes to your files: keep a backup of your vault
    (or put it under git) while trying it.
  EOS
end
