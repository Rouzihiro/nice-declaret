{...}: {
  # ZRAM SWAP
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 80;
  };
}
