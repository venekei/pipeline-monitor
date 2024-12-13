let
nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
pkgs = import nixpkgs { config = {
    permittedInsecurePackages = [
        "nix-2.16.2"
    ];
}; overlays = []; };
nvimConf = pkgs.stdenv.mkDerivation {
    name = "nvim-configuration";
    src = pkgs.fetchFromGitHub {
        repo = "init.lua";
        owner = "venekei";
    	rev = "e93745b";
	sha256 = "fUrTQ/hWFGFJ9ihIB3eXPk2Vim1COVlVXdwAx9spmUE=";
    };
    installPhase = ''
        mkdir -p $out/nvim_conf
        cp -r ./ $out/nvim_conf/
    '';
};
in

pkgs.mkShell {
    buildInputs = [
        nvimConf
    ];
    packages = with pkgs; [
        go
     	gopls
        git
    	fzf
	ripgrep
        neovim
        gnumake
        tmux
        dive
    ];
    
    shellHook = ''
	export XDG_CONFIG_HOME=~/init.lua
        tmux kill-server
        tmux start-server
        tmux new-session -d -t pdco
        tmux new-window -n nvim -t pdco nvim . 
        tmux new-window -n build -t pdco
        tmux select-window -t nvim
        tmux kill-window -t :0
        tmux attach-session -t pdco
    '';
}
