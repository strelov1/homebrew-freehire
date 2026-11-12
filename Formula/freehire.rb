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
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.29.0/freehire_darwin_arm64"
      sha256 "3a1033a4465f8fcf34e6b5362c32525465e828781a3d76a496561cc778eeab80"
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.29.0/freehire_darwin_amd64"
      sha256 "52a1e8426ef049acbd739a6f8b0a973d3b6257d39cabb4d55b5f61660594dbdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.29.0/freehire_linux_arm64"
      sha256 "2939b9146ba81575ca210edbdee353c926ac4ca8eef97f16e8569e10c2b09a26"
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.29.0/freehire_linux_amd64"
      sha256 "97223e871a97023cc60484ec48950c0de3318729d288d87963e4aae90becc9a9"
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
