# The freehire.me CLI, distributed as the prebuilt binaries attached to each
# GitHub release — there is no source build here, so the formula stays a
# checksum manifest rather than a compile recipe.
#
# Bumping: the release is cut by hand (the CLI repo has no CI), so this file has
# to be updated by hand too. Change `version`, then all four urls and sha256s —
# a partial bump serves a stale binary on the untouched platforms without failing.
class Freehire < Formula
  desc "Search 3.3M+ IT jobs from 294K company career boards on freehire.me"
  homepage "https://freehire.me/cli"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.18.0/freehire_darwin_arm64"
      sha256 "d3e2dbbc8d0e4a1efa4f7524edcd244c316ac005b16d17dcc6fca8b5b3f6c4cc"

      def install
        bin.install "freehire_darwin_arm64" => "freehire"
      end
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.18.0/freehire_darwin_amd64"
      sha256 "5c8e9e8460ee4bd7d4b73659370c209e1e64bbc68f9ba5ae29b7f44e56b39817"

      def install
        bin.install "freehire_darwin_amd64" => "freehire"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.18.0/freehire_linux_arm64"
      sha256 "934438b39c6ce765872819e04a62addd383a57c9c8658848f64083687c25d53e"

      def install
        bin.install "freehire_linux_arm64" => "freehire"
      end
    end

    on_intel do
      url "https://github.com/strelov1/freehire-cli/releases/download/v0.18.0/freehire_linux_amd64"
      sha256 "559ce92b5f015c094e0b9fcd991231833d346543c759f02013f7d457d5e8397e"

      def install
        bin.install "freehire_linux_amd64" => "freehire"
      end
    end
  end

  test do
    assert_match "freehire version v#{version}", shell_output("#{bin}/freehire --version")
  end
end
