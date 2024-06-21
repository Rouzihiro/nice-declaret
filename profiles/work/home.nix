{
...
}: let
	userDir = ./../../user;
in {
	imports = [
    (userDir + /work/languages/rust/shell.nix)
	];

}
