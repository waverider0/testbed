{
    description = "testbed";

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
                    python314
                    renderdoc
                    rr
                    sage
                    valgrind
                    wireshark
                ];

                shellHook = ''
                    # Switch to zsh
                    export SHELL=$(which zsh)
                    exec zsh

                    # Setup Python virtual environment
                    if [ ! -d ".venv/" ]; then
                        python3 -m venv .venv/
                    else
                        source ".venv/bin/activate"
                    fi
                '';
            };
        };
}
