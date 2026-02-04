{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    amdgpu_top
    glmark2
    unigine-superposition
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
