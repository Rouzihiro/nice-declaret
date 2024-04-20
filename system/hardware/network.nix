{mySettings, ...}: {
  # Networking
  networking.hostName = mySettings.system.hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Use networkmanager
  networking.firewall.enable = true;
}
