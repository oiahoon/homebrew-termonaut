class Termonaut < Formula
  desc "Gamified terminal productivity tracker with XP, achievements, and GitHub integration"
  homepage "https://github.com/oiahoon/termonaut"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/oiahoon/termonaut/releases/download/v0.10.2/termonaut-0.10.2-darwin-amd64"
      sha256 "1b9c7411ea5711d9d844bf50ad804f07fdf853b844d383dbd0983aaa7c881c2e"
    end

    on_arm do
      url "https://github.com/oiahoon/termonaut/releases/download/v0.10.2/termonaut-0.10.2-darwin-arm64"
      sha256 "e5b2660648df914b5409b428daf2f081584a5925aa9944548bd6634dd93c2148"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      bin.install "termonaut-0.10.2-darwin-amd64" => "termonaut"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "termonaut-0.10.2-darwin-arm64" => "termonaut"
    end
  end

  def caveats
    <<~EOS
      🚀 Termonaut has been installed successfully!

      To get started:
      1. Initialize shell integration:
         termonaut advanced shell install

      2. Restart your terminal or run:
         source ~/.bashrc  # or ~/.zshrc

      3. Start tracking your productivity:
         termonaut stats
         termonaut tui

      4. Set up GitHub integration (optional):
         termonaut github auth
         termonaut github sync now

      📖 Documentation: https://github.com/oiahoon/termonaut
      🐛 Issues: https://github.com/oiahoon/termonaut/issues

      Happy terminal productivity tracking! 🎯
    EOS
  end

  test do
    assert_match "0.10.2", shell_output("\#{bin}/termonaut version")
  end
end
