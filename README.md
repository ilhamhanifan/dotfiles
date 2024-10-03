# Bootstrap NIXOS
git clone https://github.com/ilhamhanifan/dotfiles ~/
export NIX_CONFIG="experimental-features = nix-command flakes"
cd ~/dotfiles/flakes && nix shell nixpkgs#home-manager nixpkgs#git
sudo nixos-rebuild switch --flake .#uzawa

'packages.x86_64-linux.nixosConfigurations."reisa".config.system.build.nixos-rebuild', 
'legacyPackages.x86_64-linux.nixosConfigurations."reisa".config.system.build.nixos-rebuild' 
'nixosConfigurations."reisa".config.system.build.nixos-rebuild'

