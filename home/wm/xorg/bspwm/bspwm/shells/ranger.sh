if file "$RNFILE" | grep -q "image"; then
    feh --bg-scale $RNFILE
    echo "feh --bg-scale $RNDIR/$RNFILE" > $HOME/.shells/background.sh
elif file "$RNFILE" | grep -q "PDF document"; then
    zathura $RNDIR/$RNFILE
else
    nvim $RNDIR/$RNFILE
fi
