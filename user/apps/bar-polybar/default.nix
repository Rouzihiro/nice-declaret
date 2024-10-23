{mySettings, ...}: let
  conf = "bar-polybar";
  src = "polybar_floating_allblack";
  dir = "polybar";
in {
  home.activation.${conf} = ''
    rm -rf ${mySettings.configDir}/${dir}

    echo ""
    echo "******* ⏳ start copy ${dir}"

    cp -r ${mySettings.userDir}/apps/${conf}/${src} \
          ${mySettings.configDir}/${dir}

    echo "******* 🥳 end in this path ${mySettings.configDir}/${dir}"
    echo ""
  '';
}
