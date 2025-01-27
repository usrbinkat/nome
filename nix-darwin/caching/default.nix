{ caches
, username
}:

{
  config = {
    nix = {
      settings = rec {
        substituters = [
          caches.nixos-org.cache
          caches.the-nix-way.cache
          caches.nix-community.cache
        ];
        trusted-public-keys = [
          caches.nixos-org.publicKey
          caches.the-nix-way.publicKey
          caches.nix-community.publicKey
        ];
        trusted-substituters = substituters;
        trusted-users = [ "root" username ];
      };
    };
  };
}
