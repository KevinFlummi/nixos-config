{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
  ];

  programs.gamemode.enable = true;
  programs.gpu-screen-recorder.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
