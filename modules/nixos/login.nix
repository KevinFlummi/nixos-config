{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "kevin";
      };

      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -t -r --remember-user-session";
        user = "greeter";
      };
    };
  };
}
