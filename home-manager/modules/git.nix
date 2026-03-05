{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jujutsu   # jj VCS
  ];

  programs.delta = {
    enable = true;
    options = {
      navigate = true;
      side-by-side = true;
      line-numbers = true;
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "jgagnon";
      user.email = "jgagnon@wealthsimple.com";
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB2NNrObDp5BIKKzFSE2q0fvOjr6whM7sZBukR9zv/us";
      core.editor = "nvim";
      pull.rebase = true;
      init.defaultBranch = "main";
      gpg.format = "ssh";
      "gpg \"ssh\"".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      commit.gpgsign = true;
    };
  };
}
