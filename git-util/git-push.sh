git config --global push.default simple

git config --global credential.helper cache
git config --global credential.helper "cache --timeout=3600"

# not working git add * under ubuntu

git add --all
git commit -m "$1"
git pull

git push

# -- to run --

# under linux or mac; assume under my-git/hkupop-legco
#
# cd ~/my-git/hkupop-legco/git-util
#
# sh git-push.sh ??any-message-for-commit??

# other global commands but not run

#    git config --global user.name "Your Name"
#    git config --global user.email you@example.com

# -- other helper links --

# http://stackoverflow.com/questions/5343068/is-there-a-way-to-skip-password-typing-when-using-https-on-github
# git config --global credential.helper osxkeychain
# git config --global credential.helper wincred
# http://www.h-online.com/open/news/item/Git-1-8-0-can-access-Windows-and-GNOME-keyrings-1733879.html
