# nixf

**nixf** is just a wrapper around nix unstable with the required flags for doing flake related things. Its purpose is to allow people to use flakes without changing the version of Nix on their system.

### Installation

`nix-env -iE '_: import (builtins.fetchGit "https://github.com/ursi/nixf.git") {}'`

