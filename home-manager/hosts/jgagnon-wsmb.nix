{ ... }:

{
  imports = [ ../default.nix ];

  programs.jujutsu.settings = {
    user = {
      name = "Jerome Gagnon";
      email = "jgagnon@wealthsimple.com";
    };
    signing = {
      backend = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB2NNrObDp5BIKKzFSE2q0fvOjr6whM7sZBukR9zv/us";
      behavior = "own";
      backends.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    };
  };
}
