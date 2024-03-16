# docker-pagefind

[![github-actions](https://github.com/theohbrothers/docker-pagefind/actions/workflows/ci-master-pr.yml/badge.svg?branch=master)](https://github.com/theohbrothers/docker-pagefind/actions/workflows/ci-master-pr.yml)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-pagefind?style=flat-square)](https://github.com/theohbrothers/docker-pagefind/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-pagefind/latest)](https://hub.docker.com/r/theohbrothers/docker-pagefind)

Dockerized [pagefind](https://github.com/CloudCannon/pagefind).

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:1.0.4`, `:latest` | [View](variants/1.0.4) |

## Usage

Mount the public directory into the container at `/public`.

```sh
docker run --rm -it -v $(pwd)/public:/public theohbrothers/docker-pagefind:1.0.4
```

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```

### Variant versions

[versions.json](generate/definitions/versions.json) contains a list of [Semver](https://semver.org/) versions, one per line.

To update versions in `versions.json`:

```powershell
./Update-Versions.ps1
```

To update versions in `versions.json`, and open a PR for each changed version, and merge successful PRs one after another (to prevent merge conflicts), and finally create a tagged release and close milestone:

```powershell
$env:GITHUB_TOKEN = 'xxx'
./Update-Versions.ps1 -PR -AutoMergeQueue -AutoRelease
```

To perform a dry run, use `-WhatIf`.
