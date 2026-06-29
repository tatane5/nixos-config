git clone https://github.com/tatane5/nixos-config.git ~/nixos-config


# Description
Configuration NixOS pour plusieurs machines dans l’avenir, débutant sous NixOS.


## Nouvelle installation :
 
Installation minimale via l’ISO officielle
 
### Installation git
````
nix shell nixpkgs#git --extra-experimental-features nix-command --extra-experimental-features flakes
````
 
### Clone dotfiles
````
git clone https://github.com/tatane5/nixos-config.git ~/nixos-config
````

````
cp /etc/nixos/hardware-configuration.nix \
   /home/nixos/nixos-config/hosts/#hostname/hardware-configuration.nix
````
````
sudo nixos-rebuild switch --flake ~/nixos-config#hostname
````
On remplace #hostname par la machine souhaitée
 
### Mise en place clé ssh
#### Générer une nouvelle clé SSH et démarrer l’agent SSH
Remplacer l’adresse mail :  
````
ssh-keygen -t ed25519 -C "ton_email@example.com"
````
````
eval "$(ssh-agent -s)"
````
````
ssh-add ~/.ssh/id_ed25519
````
#### Ajouter la clé dans Github

~/.ssh/id_ed25519.pub  
Copie de tout le contenu qui commence par : ssh-ed25519 AAAAC3...  
Coller dans Github SSH Key Settings

#### Tester la connexion
````
ssh -T git@github.com
````
Are you sure you want to continue connecting (yes/no/[fingerprint])?  
````
yes
````
#### Vérifier que le dépôt utilise SSH
````
cd ~/nixos-config
git remote -v
````
si URL en https :  
````
git remote set-url origin git@github.com:tatane5/nixos-config.git
````
#### Définition utilisateur
Remplacer name et email :  
````
git config --global user.name "userGITHUB"
git config --global user.email "mail@github"
````

## Mémo
### Pousser les mises à jour sur github :
```
cd ~/nixos-config
git status
git add .
git commit -m "mise à jour"
git push origin main
```