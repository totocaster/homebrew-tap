# Homebrew Tap

This is a custom Homebrew tap containing formulas for personal tools.

## Installation

To add this tap to your Homebrew installation, run:

```bash
brew tap totocaster/tap
```

## Available Formulas

### stamp

A simple Go CLI tool for generating note filenames based on date/time.

#### Installation

```bash
brew install totocaster/tap/stamp
```

Or install directly via URL:

```bash
brew install https://raw.githubusercontent.com/totocaster/homebrew-tap/main/Formula/stamp.rb
```

#### Features

- Generate daily note filenames (YYYY-MM-DD format)
- Generate fleeting note filenames with timestamps
- Generate project note filenames with sequential IDs
- Includes `nid` symlink for convenience

#### Usage

After installation, you can use either `stamp` or `nid` commands:

```bash
# Generate daily note filename
stamp daily
# Output: 2024-01-15

# Generate fleeting note filename
stamp fleeting
# Output: 2024-01-15-F123456

# Generate project note filename
stamp project
# Output: P2024001
```

## Updating

To update the formulas in this tap:

```bash
brew update
brew upgrade totocaster/tap/stamp
```

## Development

This tap is maintained by [totocaster](https://github.com/totocaster). Formula updates are automated via GoReleaser when new versions of the tools are released.

## License

See individual formula licenses. The stamp tool is licensed under MIT.