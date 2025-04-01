{
    description = "A fun an chaotic testbed enviroment";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    outputs = { self, nixpkgs }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
        in
        {
            devShell.${system} = pkgs.mkShell {
                buildInputs = with pkgs;
                [
                    binutils
                    clang
                    gdb
                    gcc
                    gf
                    imhex
                    netcat
                    nmap
                    python313
                    python313Packages.matplotlib
                    python313Packages.numpy
                    python313Packages.scipy
                    python313Packages.sympy
                    renderdoc
                    rr
                    sage
                    valgrind
                    wireshark
                ];

                shellHook = ''
                    export SHELL=$(which zsh)
                    exec zsh
                '';
            };
        };
}
