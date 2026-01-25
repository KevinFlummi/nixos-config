{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
  ];
  # graphics drivers
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    nvidia.open = false;
    nvidia.modesetting.enable = true;
  };
  # Niri/Noctalia fix regarding extremely high vram usage (Wayland-related)
  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text = ''
    {
        "rules": [
            {
                "pattern": {
                    "feature": "procname",
                    "matches": "niri|quickshell|noctalia-shell"
                },
                "profile": "Limit Free Buffer Pool On Wayland Compositors"
            }
        ],
        "profiles": [
            {
                "name": "Limit Free Buffer Pool On Wayland Compositors",
                "settings": [
                    {
                        "key": "GLVidHeapReuseRatio",
                        "value": 0
                    }
                ]
            }
        ]
    }
  '';
  # (tbd: add cuda support)
}
