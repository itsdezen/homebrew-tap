cask "fantasque-sans-mono-nerdfont" do
  version "1.0.0"
  sha256 "2e70b1905980be74810c1bfe00193c03d2ab8d73ab6d573f445d497d155f7481"

  url "https://github.com/itsdezen/fantasque-sans/releases/download/vietnamese-nerdfont-v#{version}/FantasqueSansMono-NerdFont.zip"
  name "FantasqueSansMono Nerd Font (Vietnamese)"
  desc "FantasqueSansMono patched with Nerd Font glyphs, built from a Vietnamese-support fork pending upstream merge (belluzj/fantasque-sans#170)"
  homepage "https://github.com/itsdezen/fantasque-sans/tree/vietnamese-support"

  conflicts_with cask: "font-fantasque-sans-mono-nerd-font"

  font "FantasqueSansMNerdFontMono-Regular.ttf"
  font "FantasqueSansMNerdFontMono-Bold.ttf"
  font "FantasqueSansMNerdFontMono-Italic.ttf"
  font "FantasqueSansMNerdFontMono-BoldItalic.ttf"

  caveats <<~EOS
    Temporary personal build while belluzj/fantasque-sans#170 (Vietnamese
    support) is pending upstream merge. Once merged and picked up by
    nerd-fonts/homebrew-cask-fonts, switch back to the official
    font-fantasque-sans-mono-nerd-font cask and remove this tap entry.
  EOS
end
