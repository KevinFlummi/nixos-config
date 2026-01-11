{pkgs, ...}: {
  # wayland ports
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.xwayland.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
    ];
    config = {
      common = {
        default = ["wlr"];
      };
    };
  };
}
