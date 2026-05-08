class Driftr < Formula
  desc "Fast JavaScript toolchain versioning without the friction"
  homepage "https://github.com/DriftrLabs/driftr"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/DriftrLabs/driftr/releases/download/v0.7.2/driftr_0.7.2_darwin_arm64.tar.gz"
      sha256 "55e83eea654e06d876b6de139a5acfca769ed5ad88c134e886bfeeb9a4bc4f7f"
    end
    on_intel do
      url "https://github.com/DriftrLabs/driftr/releases/download/v0.7.2/driftr_0.7.2_darwin_amd64.tar.gz"
      sha256 "2f0b553795cebe0ac8dac4acddada2d298bf4d91623f0d8d19a89fadf8b1f2de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DriftrLabs/driftr/releases/download/v0.7.2/driftr_0.7.2_linux_arm64.tar.gz"
      sha256 "0f7d1e5175eb182563e59b74217e13aa9e482c42462cacb2e92d8a0cdfc8f9fb"
    end
    on_intel do
      url "https://github.com/DriftrLabs/driftr/releases/download/v0.7.2/driftr_0.7.2_linux_amd64.tar.gz"
      sha256 "af81624ffdf134f0ebfa0e62e68a8c362cd100ac85755003962f49c9aab9ca8c"
    end
  end

  def install
    bin.install "driftr"
  end

  def caveats
    <<~EOS
      Run setup to create shims and data directories:
        driftr setup

      Then add ~/.driftr/bin to the FRONT of your PATH (before Homebrew):
        echo 'export PATH="$HOME/.driftr/bin:$PATH"' >> ~/.zshenv
        echo 'export PATH="$HOME/.driftr/bin:$PATH"' >> ~/.zprofile

      Or run `driftr doctor --fix` to configure PATH automatically.
      Run `driftr doctor` to verify your setup.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/driftr --version")
  end
end
