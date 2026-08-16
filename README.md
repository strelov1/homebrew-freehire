# homebrew-freehire

Homebrew tap for the [freehire.me](https://freehire.me) CLI.

```bash
brew install strelov1/freehire/freehire
freehire auth login --token fhk_xxxxxxxx
freehire search --remote --skill go
```

`freehire` is a small Go CLI over the [freehire.me](https://freehire.me) job API — an
open-source aggregator that crawls IT postings straight from company career boards, 3.3M+
open roles across 294K companies. Search, filter, score your skills against live demand,
tailor a CV against a posting, apply, and track application stages, all from the terminal.
Every command speaks `--json`.

Source, docs and issues: [strelov1/freehire-cli](https://github.com/strelov1/freehire-cli).
Prefer not to use Homebrew? `curl -fsSL https://freehire.me/install.sh | sh`, or
`go install github.com/strelov1/freehire-cli/cmd/freehire@latest`.

MIT.
