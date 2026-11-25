# Written by the release of tib 0.5.0; do not edit it here.
class Tib < Formula
  desc "Scaffolding CLI for Java services, on Spring Boot or in plain Java"
  homepage "https://github.com/mryakar/tib-cli"
  version "0.5.0"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/mryakar/tib-cli/releases/download/v0.5.0/tib-0.5.0-macos-arm64.zip"
    sha256 "e3bee6e78cd197cba184daff3333ebdad94d828268fc47d3fa5f8428e7d1f261"
  end
  on_intel do
    url "https://github.com/mryakar/tib-cli/releases/download/v0.5.0/tib-0.5.0-macos-x64.zip"
    sha256 "ba1bfbc56ff3af3cc131d36f48a9dedcf2bce5f414c53aeb990ac11b9df26335"
  end

  depends_on :macos

  def install
    # Homebrew enters the only directory of an archive, which here is the bundle itself.
    (libexec/"tib.app").install "Contents"
    bin.write_exec_script libexec/"tib.app/Contents/MacOS/tib"
    # The cache fits the class path where tib is installed; without a bottle, that is here.
    system libexec/"tib.app/Contents/app/startup-cache.sh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tib --version")
  end
end
