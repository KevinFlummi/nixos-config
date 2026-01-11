{pkgs, ...}: {
  # minimalist login manager
  services.greetd.enable = true;
  services.greetd.settings.default_session = {
    command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${pkgs.niri}/bin/niri-session";
    user = "greeter";
  };
}
