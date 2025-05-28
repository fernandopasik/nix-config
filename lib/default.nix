{ lib }:
{
  inherit (import ./winget.nix { inherit lib; }) installWingetPkgs;
}
