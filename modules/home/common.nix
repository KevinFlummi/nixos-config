{pkgs, ...}: {
  home.packages = with pkgs; [
    sl # steam locomotive
    age # encryption
    sops # encryption
    bc # calculator
    ffmpeg-full # codecs
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Kevin Ferneding";
      user.email = "email@kevinferneding.xyz";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        padding = {
          top = 1;
          left = 3;
        };
      };
      modules = [
        "break"
        {
          type = "host";
          key = " PC";
          keyColor = "cyan";
        }
        {
          type = "cpu";
          key = "  ├";
          keyColor = "cyan";
        }
        {
          type = "gpu";
          key = "  ├󰍛";
          keyColor = "cyan";
          format = "{vendor} {name}";
        }
        {
          type = "memory";
          key = "  ├󰍛";
          keyColor = "cyan";
          format = "{used} / {total}";
        }
        {
          type = "disk";
          key = "  └";
          keyColor = "cyan";
          format = "{size-used} / {size-total} ({filesystem})";
        }
        "break"
        {
          type = "os";
          key = " OS";
          keyColor = "blue";
        }
        {
          type = "kernel";
          key = "  ├";
          keyColor = "blue";
        }
        {
          type = "packages";
          key = "  └󰏖";
          keyColor = "blue";
        }
        "break"
        {
          type = "custom";
          key = " DE";
          keyColor = "cyan";
          format = "Noctalia";
        }
        {
          type = "wm";
          key = "  ├";
          keyColor = "cyan";
        }
        {
          type = "terminal";
          key = "  ├";
          keyColor = "cyan";
        }
        {
          type = "shell";
          key = "  └";
          keyColor = "cyan";
        }
        "break"
        {
          type = "command";
          key = "  OS Age";
          keyColor = "blue";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "  Uptime";
          keyColor = "blue";
        }
        {
          type = "datetime";
          key = "  DateTime";
          keyColor = "blue";
        }
        "break"
        #{
        #  type = "colors";
        #}
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
