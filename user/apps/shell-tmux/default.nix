{mySettings, ...}: let
  conf = "shell-tmux";
  src = "src";
  dir = "tmux";
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
