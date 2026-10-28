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
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.28.0/freehire_darwin_arm64"
      sha256 "ca75a6aae3fb7ca0893ab344568d7eeb92f697185ea6f65f4d6cf9e5da625d07"
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.28.0/freehire_darwin_amd64"
      sha256 "aa3b04947c4de8f8f19be0724f60de2f762822ac4cd540742e349fa573b919ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.28.0/freehire_linux_arm64"
      sha256 "289d396617957b240c86fb9496bccca0b51d21a28adf61875991e2be60105746"
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.28.0/freehire_linux_amd64"
      sha256 "0019e0743805954b5c3448455264bb01a3a1c80d1491de49138e621fb9f098be"
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
