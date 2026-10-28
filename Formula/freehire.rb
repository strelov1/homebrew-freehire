# The freehire.me CLI, distributed as the prebuilt binaries attached to each
# GitHub release — there is no source build here, so the formula stays a
# checksum manifest rather than a compile recipe.
#
# The version is scanned from the release tag in the urls; do not restate it.
#
# Bumping: the release is cut by hand (the CLI repo has no CI), so this file has
# to be updated by hand too. Change the tag in all four urls and all four
# sha256s together — a partial bump serves a stale binary on the untouched
# platforms without failing anywhere.
class Freehire < Formula
  desc "Search 3.3M+ IT jobs from 294K company career boards on freehire.me"
  homepage "https://freehire.me/cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.27.0/freehire_darwin_arm64"
      sha256 "4f525aa13a049c78995d8266a1ba44b6192058b499b42427cc2dd074495646cf"
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.27.0/freehire_darwin_amd64"
      sha256 "18b7d92f53d032f27aa2bb8c89fece39881c910980f3d48140c37631591ebe0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.27.0/freehire_linux_arm64"
      sha256 "d7b0aec9d011bd8fd41ea5cac6903255467f46ea8684a63bed39506c9839d04f"
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.27.0/freehire_linux_amd64"
      sha256 "1835b2e5808b4b1e2a7e71ee8921414e21412219c393748fcc7f36192db5670c"
    end
  end

  # One binary per platform, each named for its target; the download keeps that
  # name, so glob rather than restate it four times.
  def install
    bin.install Dir["freehire_*"].first => "freehire"
  end

  test do
    assert_match "freehire version v#{version}", shell_output("#{bin}/freehire --version")
  end
end
