{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.minimap.minimap-vim;
in {
  options.vim.minimap.minimap-vim = {
    enable = mkEnableOption "Enable minimap-vim plugin";
  };

  config = mkIf cfg.enable {
    vim.startPlugins = [
      pkgs.code-minimap
      "minimap-vim"
    ];
  };
}
