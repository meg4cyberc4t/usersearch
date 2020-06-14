#!/bin/bash
# UserSearch v1.0
# by cybercat

printf "\e[1;32m[/] Connected [/]\e[1;32m"
printf "
"
##Check "curl"
check_curl_ru=`apt-cache policy curl | grep 'Установлен'`
check_curl_en=`apt-cache policy curl | grep 'Installed'`
if [[ $check_curl_ru == *"(отсутствует)"* || $check_curl_en == *"(none)"* ]]; then
    printf "\e[1;32m[!] Addiction required! (Y-install): [!]\e[0m"
    read curl_install
    if [[ $curl_install == *"Y"* || $curl_install == *"y"*  ]]; then
         sudo apt install curl -y
         check_curl_ru=`apt-cache policy curl | grep 'Установлен'`
         check_curl_en=`apt-cache policy curl | grep 'Installed'`
             if [[ $check_curl_ru == *"(отсутствует)"* || $check_curl_en == *"(none)"* ]]; then
                 printf "\e[1;31m[!] An error occurred during installation. Please try again! [!] \e[0m\e[1;31m"
                printf "
"
                exit 1
            fi 
         else
            printf "\e[1;31m[×] End [×]\e[0m\e[1;31m"
            printf "
"
            exit 1
    fi
       
fi

##Banner
printf "\e[1;32m   ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ 
 \e[0m"
printf "\e[1;32m ||\e[0;00mU \e[1;32m|||\e[0;00ms \e[1;32m|||\e[0;00me \e[1;32m|||\e[0;00mr \e[1;32m|||\e[0;00mS \e[1;32m|||\e[0;00me \e[1;32m|||\e[0;00ma \e[1;32m|||\e[0;00mr \e[1;32m|||\e[0;00mc \e[1;32m|||\e[0;00mh \e[1;32m||
 \e[0m"
printf "\e[1;32m ||__|||__|||__|||__|||__|||__|||__|||__|||__|||__||
 \e[0m"
printf "\e[1;32m |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
 \e[0m"
printf "\e[1;00m            Made by cybercat  |  UserSearch v1.0 \e[0m"
printf "\e[1;00m  
\e[0m"

##Nick input
read -p $'\e[1;32m[?] Enter Username:\e[0m ' username

##Check "Invalid name"
if [[ -z $username ]]; then 
printf "\e[1;31m[\e[0m\e[1;31m!\e[1;31m]\e[1;31m Invalid name!\e[0m\e[1;31m\e[0m" $username
printf "
"
exit 1
fi

##Check previous file
if [[ -e $username.txt ]]; then
printf "\e[1;32m[!] Rewrite previous file:\e[0m\e[1;32m %s.txt" $username
rm -rf $username.txt
fi
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m✓\e[0m\e[1;92m] Search started: \e[0m\e[1;77m %s\e[0m\e[1;92m  \e[0m\n"

##Main
printf "\e[1;92m ------------- Main: ------------- %s\n \e[0m" 

#facebook.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m]Facebook: \e[0m"
check=$(curl -s "https://www.facebook.com/$username" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)
if [[ $check == *'1'* ]]; then
printf "\e[1;92m ✓\e[0m https://www.facebook.com/%s\n" $username
printf "https://www.facebook.com/%s\n" $username >> $username.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93m×\e[0m\n"
fi

#instagram.com
check=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"
if [[ $check == *'1'* ]]; then
printf "\e[1;92m ✓\e[0m https://www.instagram.com/%s\n" $username
printf "https://www.instagram.com/%s\n" $username > $username.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93m ×\e[0m\n"
fi

#twitter.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Twitter: \e[0m"
check=$(curl -s "https://www.twitter.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)
if [[ $check == *'1'* ]]; then
printf "\e[1;92m ✓\e[0m https://www.twitter.com/%s\n" $username
printf "https://www.twitter.com/%s\n" $username >> $username.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93m×\e[0m\n"
fi

#vk.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] VK: \e[0m"
check=$(curl -s -i "https://vk.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://vk.com/%s\n" $username
printf "https://vk.com/%s\n" $username >> $username.txt
fi

#youtube.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] YouTube: \e[0m"
check=$(curl -s "https://www.youtube.com/$username" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)
if [[ $check == *'1'* ]]; then
printf "\e[1;92m ✓\e[0m https://www.youtube.com/%s\n" $username
printf "https://www.youtube.com/%s\n" $username >> $username.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93m×\e[0m\n"
fi

#steamcommunity.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Steam: \e[0m"
check=$(curl -s -i "https://steamcommunity.com/id/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'The specified profile could not be found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://steamcommunity.com/id/%s\n" $username
printf "https://steamcommunity.com/id/%s\n" $username >> $username.txt
fi

##Secondary
printf "\e[1;92m ------------- Secondary: ------------- %s\n" 

#badoo.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Badoo: \e[0m"
check=$(curl -s -i "https://www.badoo.com/en/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.badoo.com/en/%s\n" $username
printf "https://www.badoo.com/en/%s\n" $username >> $username.txt
fi

#blogger/blogspot.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Blogger: \e[0m"
check=$(curl -s "https://$username.blogspot.com" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404'; echo $?)
if [[ $check == *'1'* ]]; then
printf "\e[1;92m ✓\e[0m https://%s.blogspot.com\n" $username
printf "https://%s.blogspot.com\n" $username >> $username.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93m×\e[0m\n"
fi

#github.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Github: \e[0m"
check=$(curl -s -i "https://www.github.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.github.com/%s\n" $username
printf "https://www.github.com/%s\n" $username >> $username.txt
fi

#news.ycombinator.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HackerNews: \e[0m"
check=$(curl -s -i "https://news.ycombinator.com/user?id=$username" -H "Accept-Language: en" -L | grep -o 'No such user' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://news.ycombinator.com/user?id=%s\n" $username
printf "https://news.ycombinator.com/user?id=%s\n" $username >> $username.txt
fi

#last.fm
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Last.fm: \e[0m"
check=$(curl -s -i "https://last.fm/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://last.fm/user/%s\n" $username
printf "https://last.fm/user/%s\n" $username >> $username.txt
fi

#my.mail.ru
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Мой мир: \e[0m"
check=$(curl -s -i "https://my.mail.ru/mail/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/1.1 404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://my.mail.ru/mail/%s\n" $username
printf "https://my.mail.ru/mail\n" $username >> $username.txt
fi

#patreon.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Patreon: \e[0m"
check=$(curl -s -i "https://www.patreon.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.patreon.com/%s\n" $username
printf "https://www.patreon.com/%s\n" $username >> $username.txt
fi

#pinterest.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pinterest: \e[0m"
check=$(curl -s -i "https://www.pinterest.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '?show_error' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.pinterest.com/%s\n" $username
printf "https://www.pinterest.com/%s\n" $username >> $username.txt
fi

#reddit.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Reddit: \e[0m"
check=$(curl -s -i "https://www.reddit.com/user/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | head -n1 | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.reddit.com/user/%s\n" $username
printf "https://www.reddit.com/user/%s\n" $username >> $username.txt
fi

#soundcloud.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] SoundCloud: \e[0m"
check=$(curl -s -i "https://soundcloud.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found'; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://soundcloud.com/%s\n" $username
printf "https://soundcloud.com/%s\n" $username >> $username.txt
fi

#spotify.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Spotify: \e[0m"
check=$(curl -s -i "https://spotify.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://spotify.com/%s\n" $username
printf "https://spotify.com/%s\n" $username >> $username.txt
fi

#ok.ru
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Spotify: \e[0m"
check=$(curl -s -i "https://spotify.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://spotify.com/%s\n" $username
printf "https://spotify.com/%s\n" $username >> $username.txt
fi

#vimeo.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Vimeo: \e[0m"
check=$(curl -s -i "https://vimeo.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://vimeo.com/%s\n" $username
printf "https://vimeo.com/%s\n" $username >> $username.txt
fi

#wikipedia.org
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wikipedia: \e[0m"
check=$(curl -s -i "https://www.wikipedia.org/wiki/User:$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.wikipedia.org/wiki/User:%s\n" $username
printf "https://www.wikipedia.org/wiki/User:%s\n" $username >> $username.txt
fi

##Last
printf "\e[1;92m --------------- Last: ---------------- %s\n" 

#500px.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] 500px: \e[0m"
check=$(curl -s -i "https://500px.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://500px.com/%s\n" $username
printf "https://500px.com/%s\n" $username >> $username.txt
fi

#about.me
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] About.me: \e[0m"
check=$(curl -s -i "https://about.me/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://about.me/%s\n" $username
printf "https://about.me/%s\n" $username >> $username.txt
fi

#bandcamp.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Bandcamp: \e[0m"
check=$(curl -s -i "https://www.bandcamp.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.bandcamp.com/%s\n" $username
printf "https://www.bandcamp.com/%s\n" $username >> $username.txt
fi

#basecamp.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Basecamp: \e[0m"
check=$(curl -s -i "https://$username.basecamphq.com/login" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://%s.basecamphq.com/login\n" $username
printf "https://%s.basecamphq.com/login\n" $username >> $username.txt
fi

#behance.net
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Behance: \e[0m"
check=$(curl -s -i "https://www.behance.net/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.behance.net/%s\n" $username
printf "https://www.behance.net/%s\n" $username >> $username.txt
fi

#bitbucket.org
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] BitBucket: \e[0m"
check=$(curl -s -i "https://bitbucket.org/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://bitbucket.org/%s\n" $username
printf "https://bitbucket.org/%s\n" $username >> $username.txt
fi

#blip.fm
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Blip.fm: \e[0m"
check=$(curl -s -i "https://blip.fm/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://blip.fm/%s\n" $username
printf "https://blip.fm/%s\n" $username >> $username.txt
fi

#buzzfeed.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Buzzfeed: \e[0m"
check=$(curl -s -i "https://buzzfeed.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://buzzfeed.com/%s\n" $username
printf "https://buzzfeed.com/%s\n" $username >> $username.txt
fi

#codecademy.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Codecademy: \e[0m"
check=$(curl -s -i "https://www.codecademy.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.codecademy.com/%s\n" $username
printf "https://www.codecademy.com/%s\n" $username >> $username.txt
fi

#codementor.io
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CodeMentor: \e[0m"
check=$(curl -s -i "https://www.codementor.io/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.codementor.io/%s\n" $username
printf "https://www.codementor.io/%s\n" $username >> $username.txt
fi

#contently.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Contently: \e[0m"
check=$(curl -s -i "https://$username.contently.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://%s.contently.com\n" $username
printf "https://%s.contently.com\n" $username >> $username.txt
fi

#creativemarket.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CreativeMarket: \e[0m"
check=$(curl -s -i "https://creativemarket.com/$username" -H "Accept-Language: en" -L | grep -o '404eef72' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://creativemarket.com/%s\n" $username
printf "https://creativemarket.com/%s\n" $username >> $username.txt
fi

#designspiration.net
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Designspiration: \e[0m"
check=$(curl -s -i "https://www.designspiration.net/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.designspiration.net/%s\n" $username
printf "https://www.designspiration.net/%s\n" $username >> $username.txt
fi

#deviantart.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] DeviantART: \e[0m"
check=$(curl -s -i "https://$username.deviantart.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://%s.deviantart.com\n" $username
printf "https://%s.deviantart.com\n" $username >> $username.txt
fi

#disqus.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Disqus: \e[0m"
check=$(curl -s -i "https://disqus.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 NOT FOUND' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://disqus.com/%s\n" $username
printf "https://disqus.com/%s\n" $username >> $username.txt
fi

#dribbble.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Dribbble: \e[0m"
check=$(curl -s -i "https://dribbble.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://dribbble.com/%s\n" $username
printf "https://dribbble.com/%s\n" $username >> $username.txt
fi

#ebay.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ebay: \e[0m"
check=$(curl -s -i "https://www.ebay.com/usr/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|eBay Profile - error' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.ebay.com/usr/%s\n" $username
printf "https://www.ebay.com/usr/%s\n" $username >> $username.txt
fi

#ello.co
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ello: \e[0m"
check=$(curl -s -i "https://ello.co/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://ello.co/%s\n" $username
printf "https://ello.co/%s\n" $username >> $username.txt
fi

#etsy.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Etsy: \e[0m"
check=$(curl -s -i "https://www.etsy.com/shop/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.etsy.com/shop/%s\n" $username
printf "https://www.etsy.com/shop/%s\n" $username >> $username.txt
fi

#flickr.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flickr: \e[0m"
check=$(curl -s -i "https://www.flickr.com/people/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.flickr.com/photos/%s\n" $username
printf "https://www.flickr.com/photos/%s\n" $username >> $username.txt
fi

#flipboard.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flipboard: \e[0m"
check=$(curl -s -i "https://flipboard.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://flipboard.com/@%s\n" $username
printf "https://flipboard.com/@%s\n" $username >> $username.txt
fi

#goodreads.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] GoodReads: \e[0m"
check=$(curl -s -i "https://www.goodreads.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.goodreads.com/%s\n" $username
printf "https://www.goodreads.com/%s\n" $username >> $username.txt
fi

#gravatar.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gravatar: \e[0m"
check=$(curl -s -i "https://en.gravatar.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://en.gravatar.com/%s\n" $username
printf "https://en.gravatar.com/%s\n" $username >> $username.txt
fi

#gumroad.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gumroad: \e[0m"
check=$(curl -s -i "https://www.gumroad.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.gumroad.com/%s\n" $username
printf "https://www.gumroad.com/%s\n" $username >> $username.txt
fi

#houzz.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Houzz: \e[0m"
check=$(curl -s -i "https://houzz.com/user/$username" -H "Accept-Language: en" -L | grep -o 'an error has occurred' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://houzz.com/user/%s\n" $username
printf "https://houzz.com/user/%s\n" $username >> $username.txt
fi

#hubpages.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HubPages: \e[0m"
check=$(curl -s -i "https://$username.hubpages.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://%s.hubpages.com/\n" $username
printf "https://%s.hubpages.com/\n" $username >> $username.txt
fi

#ifttt.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] IFTTT: \e[0m"
check=$(curl -s -i "https://www.ifttt.com/p/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.ifttt.com/p/%s\n" $username
printf "https://www.ifttt.com/p/%s\n" $username >> $username.txt
fi

#imgur.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Imgur: \e[0m"
check=$(curl -s -i "https://imgur.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://imgur.com/user/%s\n" $username
printf "https://imgur.com/user/%s\n" $username >> $username.txt
fi

#instructables.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instructables: \e[0m"
check=$(curl -s -i "https://www.instructables.com/member/$username" -H "Accept-Language: en" -L | grep -o '404 NOT FOUND' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.instructables.com/member/%s\n" $username
printf "https://www.instructables.com/member/%s\n" $username >> $username.txt
fi

#keybase.io
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Keybase: \e[0m"
check=$(curl -s -i "https://keybase.io/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://keybase.io/%s\n" $username
printf "https://keybase.io/%s\n" $username >> $username.txt
fi

#kongregate.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Kongregate: \e[0m"
check=$(curl -s -i "https://kongregate.com/accounts/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://kongregate.com/accounts/%s\n" $username
printf "https://kongregate.com/accounts/%s\n" $username >> $username.txt
fi

#livejournal.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] LiveJournal: \e[0m"
check=$(curl -s -i "https://$username.livejournal.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://%s.livejournal.com\n" $username
printf "https://%s.livejournal.com\n" $username >> $username.txt
fi

#medium.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Medium: \e[0m"
check=$(curl -s -i "https://medium.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://medium.com/@%s\n" $username
printf "https://medium.com/@%s\n" $username >> $username.txt
fi

#mixcloud.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] MixCloud: \e[0m"
check=$(curl -s -i "https://www.mixcloud.com/$username" -H "Accept-Language: en" -L | grep -o 'error-message' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.mixcloud.com/%s\n" $username
printf "https://www.mixcloud.com/%s\n" $username >> $username.txt
fi

#newgrounds.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Newgrounds: \e[0m"
check=$(curl -s -i "https://$username.newgrounds.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://%s.newgrounds.com\n" $username
printf "https://%s.newgrounds.com\n" $username >> $username.txt
fi

#okcupid.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] OkCupid: \e[0m"
check=$(curl -s -i "https://www.okcupid.com/profile/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.okcupid.com/profile/%s\n" $username
printf "https://www.okcupid.com/profile/%s\n" $username >> $username.txt
fi

#pastebin.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pastebin: \e[0m"
check=$(curl -s -i "https://pastebin.com/u/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'location: /index' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://pastebin.com/u/%s\n" $username
printf "https://pastebin.com/u/%s\n" $username >> $username.txt
fi

#reverbnation.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] ReverbNation: \e[0m"
check=$(curl -s -i "https://www.reverbnation.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓ \e[0m https://www.reverbnation.com/%s\n" $username
printf "https://www.reverbnation.com/%s\n" $username >> $username.txt
fi

#scribd.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Scribd: \e[0m"
check=$(curl -s -i "https://www.scribd.com/$username" -H "Accept-Language: en" -L | grep -o 'show_404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.scribd.com/%s\n" $username
printf "https://www.scribd.com/%s\n" $username >> $username.txt
fi

#tracky.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tracky: \e[0m"
check=$(curl -s -i "https://tracky.com/user/$username" -H "Accept-Language: en" -L | grep -o 'profile:username' ; echo $?)
if [[ $check == *'1'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'0'* ]]; then 
printf "\e[1;92m ✓\e[0m https://tracky.com/~%s\n" $username
printf "https://tracky.com/~%s\n" $username >> $username.txt
fi

#trakt.tv
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trakt: \e[0m"
check=$(curl -s -i "https://www.trakt.tv/users/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.trakt.tv/users/%s\n" $username
printf "https://www.trakt.tv/users/%s\n" $username >> $username.txt
fi

#tripadvisor.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] TripAdvisor: \e[0m"
check=$(curl -s -i "https://tripadvisor.com/members/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://tripadvisor.com/members/%s\n" $username
printf "https://tripadvisor.com/members/%s\n" $username >> $username.txt
fi

#tumblr.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tumblr: \e[0m"
check=$(curl -s -i "https://$username.tumblr.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://%s.tumblr.com\n" $username
printf "https://%s.tumblr.com\n" $username >> $username.txt
fi

#wattpad.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wattpad: \e[0m"
check=$(curl -s -i "https://www.wattpad.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://www.wattpad.com/user/%s\n" $username
printf "https://www.wattpad.com/user/%s\n" $username >> $username.txt
fi


#wordpress.com
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wordpress: \e[0m"
check=$(curl -s -i "https://$username.wordpress.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Do you want to register' ; echo $?)
if [[ $check == *'0'* ]] ; then 
printf "\e[1;93m×\e[0m\n"
elif [[ $check == *'1'* ]]; then 
printf "\e[1;92m ✓\e[0m https://%s.wordpress.com\n" $username
printf "https://%s.wordpress.com\n" $username >> $username.txt
fi

##End
exit 1
