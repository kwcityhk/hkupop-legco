git config --global push.default simple

git config --global credential.helper cache
git config --global credential.helper "cache --timeout=3600"

git add *
git commit -m "%1"
git pull

git push

# -- to run --

# sh git-util/git-push.sh

# -- other helper links --

# http://stackoverflow.com/questions/5343068/is-there-a-way-to-skip-password-typing-when-using-https-on-github
# git config --global credential.helper osxkeychain
# git config --global credential.helper wincred
# http://www.h-online.com/open/news/item/Git-1-8-0-can-access-Windows-and-GNOME-keyrings-1733879.html
