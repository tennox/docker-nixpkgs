_: pkgs: {
  # lib stuff can be in the top-level
  buildCLIImage = pkgs.callPackage ./lib/buildCLIImage.nix {};

  # docker images must be lower-cased
  docker-nixpkgs = rec {

    bash = pkgs.callPackage ./bash {};
    curl = pkgs.callPackage ./curl {};
    docker-compose = pkgs.callPackage ./docker-compose {
      docker-compose =
         # master
         pkgs.docker-compose or
         # 18.09
         pkgs.python3Packages.docker_compose;
    };
    kubectl = pkgs.callPackage ./kubectl {};
    kubernetes-helm = pkgs.callPackage ./kubernetes-helm {};
    nix = pkgs.callPackage ./nix {};
    nix-unstable = nix.overrideAttrs (self: { nix = pkgs.nixUnstable; });

  };
}
