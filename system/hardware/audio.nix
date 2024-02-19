{ config, lib, ... }:


{
	# Enable sound.
	hardware.pulseaudio.enable = false;
	sound.enable = true;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		wireplumber.enable = true;
		jack.enable = true;
	};
}
