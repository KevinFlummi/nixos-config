{dotfiles, ...}: {
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "de";
  services.xserver.xkb.extraLayouts.mine = {
    description = "Neoqwertz-MINE Keyboard Layout";
    languages = ["mine"];
    symbolsFile = "${dotfiles}/keyboard/mine";
  };
}
