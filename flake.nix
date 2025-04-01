{
    description = "A fun and chaotic testbed enviroment";

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
                    cutter
                    gdb
                    gcc
                    gf
                    ghidra
                    imhex
                    netcat
                    nmap
                    odin
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
                    zig
                ];

                shellHook = ''
                    export SHELL=$(which zsh)
                    exec zsh
                '';
            };
        };
}
