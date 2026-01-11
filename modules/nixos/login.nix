{
  services.xserver.enable = true;

  services.displayManager.ly = {
    enable = true;
    settings = {
      animate = true;
      clock = true;
      save = true;
      default_user = "kevin";
    };
  };
}
