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
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.26.3/freehire_darwin_arm64"
      sha256 "f553d3d687c80327dbe3572b62826d94e97245fa58069f3a20bbf61c9f50020a"
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.26.3/freehire_darwin_amd64"
      sha256 "b0e0a3617130678eb6b62aaf70ad93ec1b1836473eb23696bae44809f3710edf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.26.3/freehire_linux_arm64"
      sha256 "5df229b8d8e3ac9f2d2edf336ec3658c59155640bb271197b4c675003389961c"
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.26.3/freehire_linux_amd64"
      sha256 "dcc8ebd0e2405e816fa422e1c395e872cb63abae8904c1e75d159d4f2c031f25"
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
