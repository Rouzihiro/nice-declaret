{mySettings, ...}: {
  # Timezone and locale
  time.timeZone = mySettings.system.timezone; # time zone
  i18n.defaultLocale = mySettings.system.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = mySettings.system.locale;
    LC_IDENTIFICATION = mySettings.system.locale;
    LC_MEASUREMENT = mySettings.system.locale;
    LC_MONETARY = mySettings.system.locale;
    LC_NAME = mySettings.system.locale;
    LC_NUMERIC = mySettings.system.locale;
    LC_PAPER = mySettings.system.locale;
    LC_TELEPHONE = mySettings.system.locale;
    LC_TIME = mySettings.system.locale;
  };
}
