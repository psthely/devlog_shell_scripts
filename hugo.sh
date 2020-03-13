# données du script
installation_path=~/
site_name=test_hugo
site_url=http://example.org/
site_language=en-us
site_title="My New Hugo Site"
theme_name=ananke
theme_url=https://github.com/budparr/gohugo-theme-ananke.git
github_https=https://github.com/psthely/hugo_test.git
user_name=psthely
user_email=psthely.webdev@gmail.com

# installer Hugo
## pré-recquis
# installer git
sudo apt-get install git

# installer snapd
sudo apt-get install snapd

# ajouter /snap/bin/ à PATH (temporaire)
PATH="$PATH:/snap/bin/"

## installation
# installer hugo
snap install hugo
## tests
# test git
git version
# test snapd
snap version
# test hugo
hugo version

# créer un nouveau site
## pré-recquis
# chemin d'installation du site
echo $installation_path
# nom du site
echo $site_name
# url du site
echo $site_url
# langue du site
echo $site_language
# titre du site
echo $site_title

# créer un nouveau site hugo
cd $installation_path
hugo new site $site_name
cd $site_name
echo 'baseURL = "'$site_url'"' > config.toml
echo 'languageCode = "'$site_language'"' >> config.toml
echo 'title = "'$site_title'"' >> config.toml

# utiliser un thème
## pré-recquis
# nom du thème
echo $theme_name
# url du thème
echo $theme_url

# installer le thème
# initialiser git
cd $installation_path; cd $site_name
git init

# ajouter le sous-module git du thème
git submodule add $theme_url themes/$theme_name

# activer le thème dans config.toml
echo 'theme = "'$theme_name'"' >> config.toml

# ajouter un article de blog
hugo new posts/new_draft_post.md
# générer le site statique
hugo

# rendre un article visible :
# modifier le champ "draft" à "false" :
# draft = false

# démarrer un serveur local
# démarrer un serveur local
# hugo server
# prendre en compte les brouillons
# hugo server -D

# publier sur github
## pré-recquis
# url du dépôt github
echo $github_https

# git user.name
git config --global user.name "$user_name"
# git user.email
git config --global user.email "$user_email"

# publier sur github
# ajouter l'origine du dossier "public/"
cd $installation_path; cd $site_name
cd public
git init
git remote add origin $github_https

# créer un script de déploiement sur github
cd $installation_path; cd $site_name
touch deploy.sh
echo "cd public" > deploy.sh
echo "git add *; git commit -m \"date: trigger automatic push\"" >> deploy.sh
echo "git push -u origin master" >> deploy.sh
sudo chmod +x deploy.sh

# déployer sur netlify
# TODO pas encore en ligne de commande
# lier un nom de domaine au repo github :
# créer un nouveau site sur netlify
# le lier à l'url du repo github

# TODO pas encore en ligne de commande
# sur la page du site netlify cliquer sur "trigger deploy"

# TODO pas encore en ligne de commande
# si la publication automatique n'est pas activée,
# cliquer sur "publish"


