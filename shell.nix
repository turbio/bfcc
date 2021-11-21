{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = with pkgs;[
    clang_12
    cargo
    rls
    rustc
    rustfmt
    ncurses
    libffi
    libxml2
    llvm_12
  ];

  shellHook = ''
    export LLVM_SYS_120_PREFIX=${pkgs.llvm_12.dev}
    export RUST_BACKTRACE=1
  '';
}
