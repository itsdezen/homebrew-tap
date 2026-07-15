# This is the formula `brew install itsdezen/tap/tili` actually reads —
# itsdezen/tili's own Formula/tili.rb is a versioned-alongside-the-code
# copy of this file, not the other way around (see that repo's
# CONTRIBUTING.md "Release Engineering" section). After each tili release,
# update `version` and both `sha256` values below from the release's
# `*.tar.gz.sha256` files (or `xtask package`'s own output), then copy the
# same change back into tili's copy.
class Tili < Formula
  desc "i3-like tiling window manager for macOS"
  homepage "https://github.com/itsdezen/tili"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/itsdezen/tili/releases/download/v#{version}/tili-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "ce3c3064f8d23f96b09a156654a12b6f12eaf6b836d3df8d32eaa76007493031"
  end

  on_intel do
    url "https://github.com/itsdezen/tili/releases/download/v#{version}/tili-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "e219f6e1186f452dfac18d94710d6b89a30f0177a442a0144109f98f9ad45387"
  end

  def install
    # The release tarball contains `tili.app/` (a minimal bundle wrapping
    # both binaries — see xtask/src/main.rs's `bundle` command, which
    # exists specifically so Accessibility permission and codesigning have
    # a stable, nameable bundle identifier to attach to rather than a bare
    # Unix executable). Install the bundle itself into the Cellar and
    # symlink the two executables into `bin`, same as any other formula's
    # binaries — a symlink doesn't invalidate the target's own signature.
    prefix.install "tili.app"
    bin.install_symlink prefix/"tili.app/Contents/MacOS/tili"
    bin.install_symlink prefix/"tili.app/Contents/MacOS/tili-daemon"
    bin.install_symlink prefix/"tili.app/Contents/MacOS/tili-menubar"
  end

  def caveats
    <<~EOS
      tili-daemon needs Accessibility permission to manage windows:
        System Settings > Privacy & Security > Accessibility > add tili-daemon

      Try it out (also installs the menu bar workspace badge):
        tili start

      Remove tili's config, logs, socket, and Accessibility grant:
        tili uninstall
    EOS
  end

  test do
    system "#{bin}/tili", "--help"
  end
end
