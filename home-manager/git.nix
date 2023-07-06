{ pkgs }:

{
  enable = true;
  userName = "usrbinkat";
  userEmail = "usrbinkat@braincraft.io";
  package = pkgs.gitAndTools.gitFull;

  delta = { enable = true; };

  lfs = { enable = true; };

  ignores = [
    "result/"
    ".cache/"
    ".DS_Store"
    ".direnv/"
    ".idea/"
    "*.swp"
    "built-in-stubs.jar"
    "dumb.rdb"
    ".elixir_ls/"
    ".vscode/"
    "npm-debug.log"
  ];
  aliases = (import ./aliases.nix { inherit pkgs; }).git;

  extraConfig = {
    core = {
      editor = "nvim";
      whitespace = "trailing-space,space-before-tab";
    };

    commit.gpgsign = "false";
    gpg.program = "gpg2";

    protocol.keybase.allow = "always";
    credential.helper = "osxkeychain";
    pull.rebase = "false";
    init.defaultBranch = "main";

    user = { signingkey = "REPLACEME"; };
  };
}
