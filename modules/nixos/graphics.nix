{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    amdgpu_top
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
