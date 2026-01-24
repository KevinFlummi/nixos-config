{
  # graphics drivers
  xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    nvidia.open = false;
    nvidia.modesetting.enable = true;
  };
  # (tbd: add cuda support)
}
