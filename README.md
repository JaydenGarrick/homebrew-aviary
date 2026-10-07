# homebrew-aviary

Homebrew tap for [aviary](https://github.com/JaydenGarrick/aviary).

```bash
brew install JaydenGarrick/aviary/aviary
```

## Cutting a release

```bash
# in the aviary repo
git tag vX.Y.Z && git push --tags

# compute the tarball checksum
curl -sL https://github.com/JaydenGarrick/aviary/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256

# then in Formula/aviary.rb: bump `url` to vX.Y.Z and paste the new `sha256`
brew audit --strict --online aviary   # optional sanity check
```
