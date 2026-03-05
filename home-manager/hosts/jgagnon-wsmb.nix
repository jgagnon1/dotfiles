{ ... }:

{
  imports = [ ../default.nix ];

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Jerome Gagnon";
        email = "jgagnon@wealthsimple.com";
      };
      ui = {
        editor = "nvim";
        default-command = [ "log" "--reversed" ];
      };
      git = {
        sign-on-push = true;
      };
      aliases = {
        drop = [ "abandon" ];
        copy = [ "duplicate" ];
        log-recent = [ "log" "-r" "recent()" ];
        c = [ "commit" ];
        ci = [ "commit" "--interactive" ];
        e = [ "edit" ];
        i = [ "git" "init" "--colocate" ];
        nb = [ "bookmark" "create" "-r @-" ];
        pull = [ "git" "fetch" ];
        push = [ "git" "push" "--allow-new" ];
        r = [ "rebase" ];
        s = [ "squash" ];
        si = [ "squash" "--interactive" ];
        tug = [ "bookmark" "move" "--from" "closest_bookmark(@-)" "--to" "@-" ];
      };
      "revset-aliases" = {
        "immutable_heads()" = "builtin_immutable_heads() & remote_bookmarks()";
        "recent()" = ''committer_date(after:"3 months ago")'';
        "closest_bookmark(to)" = "heads(::to & bookmarks())";
      };
      signing = {
        backend = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB2NNrObDp5BIKKzFSE2q0fvOjr6whM7sZBukR9zv/us";
        behavior = "own";
        backends.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
    };
  };
}
