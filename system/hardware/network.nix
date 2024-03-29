{systemSettings, ...}: {
  # Networking
  networking.hostName = systemSettings.hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Use networkmanager
  networking.firewall.enable = true;
}
