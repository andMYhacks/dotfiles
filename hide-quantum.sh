#!/bin/bash
# 
# Based upon [[https://superuser.com/questions/1268732/how-to-hide-tab-bar-tabstrip-in-firefox-57-quantum/1268734#1268734][How to hide tab bar (tabstrip) in Firefox 57+ Quantum]] by [[https://superuser.com/users/162466/vasyanovikov][VasyaNovikov]]
# This causes the [[https://support.mozilla.org/en-US/questions/1187186][The Back Button is top right under the Red close button on my Mac]] issue.
# Resolve that by right-clicking the toolbar, then inserting three Flexible Space into the toolbar on the far-left-hand side.
case $( uname ) in
"Linux")
  profile_dir=~/.mozilla/firefox/$( ls -tr ~/.mozilla/firefox/ | grep -v profiles.ini | tail -1 )
  ;;
"Darwin")
  profile_dir=~/Library/Application\ Support/Firefox/Profiles/$( ls -tr ~/Library/Application\ Support/Firefox/Profiles | tail -1 )
  ;;
esac
if [ ! -d  "${profile_dir}"/chrome ] ; then
  mkdir -p "${profile_dir}"/chrome
fi
echo '#TabsToolbar { visibility: collapse !important; }' >> "${profile_dir}"/chrome/userChrome.css
