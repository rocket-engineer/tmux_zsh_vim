#!/bin/bash
#
# Autor:    rocketplane
# Filename: colors.sh

# +-------------------------------------------------
# | Print System Information (Power-Shell)
# +-------------------------------------------------

# Define Extended ASCII Chars for Unicode
cTopR=$(env printf "\u2554")
lVerD=$(env printf "\u2551")
cBotR=$(env printf "\u255A")
lHorD=$(env printf "\u2550")
cTopL=$(env printf "\u2557")
cBotL=$(env printf "\u255D")
tHorL=$(env printf "\u2563")
tHorR=$(env printf "\u2560")
tVerT=$(env printf "\u2566")
tVerB=$(env printf "\u2569")

count=0

# /**
#  * printSystemInfoLine
#  *
#  * @access public
#  * @return void
#  */
function printSystemInfoLine()
{
    if [ $(( $count % 2 )) = 0 ]; then
        bg="\e[231;48;5;52m"
    else
        bg="\e[231;48;5;88m"
    fi

    if [ "$TERM" = 'linux' ]; then
        bg=$bakred
    fi

    (( count++ ))
    local l1=${#1}
    local l2=${#2}
    local lG=$(( l1 + l2 + 4 ))

    # Print Line
    echo -en "${txtred}${lVerD}${txtrst}${bg} ${bldwht}${1} ${txtrst}${txtred}${lVerD}${txtwht}${bg} ${2}"

    # Fill Line with Whitespaces
    for c in $( seq 3 $((${COLUMNS} - ${lG})) ); do echo -ne " "; done

    echo -e "${txtrst}${txtred}${lVerD}"
}

# /**
#  * printToPos
#  *
#  * @param row
#  * @param column
#  * @param data
#  *
#  * @access public
#  * @return void
#  */
function printToPos()
{
    echo -en "\e[s\e[${1};${2}f${3}\e[0m\e[u"
}

# /**
#  * printHeaderTopLine
#  *
#  * @access public
#  * @return void
#  */
function printHeaderTopLine()
{
    # Print Top Line
    echo -ne "${txtred}${cTopR}"
    for c in $( seq 0 15 ); do echo -ne "${lHorD}"; done
    echo -ne "${tVerT}"
    for c in $( seq 3 $((${COLUMNS} - 17)) ); do echo -ne "${lHorD}"; done
    echo -e "${cTopL}${txtrst}"
}

# /**
#  * printHeaderBottomLine
#  *
#  * @access public
#  * @return void
#  */
function printHeaderBottomLine()
{
    # Print Bottom Line
    echo -ne "${txtrst}${txtred}${cBotR}"
    for c in $( seq 0 15 ); do echo -ne "${lHorD}"; done
    echo -ne "${tVerB}"
    for c in $( seq 3 $((${COLUMNS} - 17)) ); do echo -ne "${lHorD}"; done
    echo -e "${cBotL}${txtrst}"
}

# /**
#  * printSystemInfo
#  *
#  * @access public
#  * @return void
#  */
function printSystemInfo()
{
    printHeaderTopLine

    #if [ -f '/var/log/lastlog' ]; then
    #    local tll=$(lastlog -u "$USER_NAME" | tail -1 | sed 's/  */ /g' | cut -d ' ' -f2-)
    #    local from=$(echo "$tll" | rev | cut -d ' ' -f7- | rev)
    #    local date=$(echo "$tll" | rev | cut -d ' ' -f1-6 | rev)
    #    lastLog="From: $from Date: $date"
    #else
    #    lastLog=$(last "$USER_NAME" 2>/dev/null | tail -3 | head -1| sed 's/  */ /g' | cut -d ' ' -f4- | tr -d '\n')
    #    if [ -z "${lastLog}" ]; then
    #        lastLog="Keine Daten vorhanden"
    #    fi
    #fi

    printSystemInfoLine "    Last Login" "$lastLog"
    printSystemInfoLine "          Time" "$(date) (Unix-Timestamp: $(date +%s))"
    printSystemInfoLine "     Processes" "${USER}'s $(ps aux | grep $USER | wc -l) / Total: $(ps aux | wc -l)"
    printSystemInfoLine "        Uptime" "$(uptime | sed 's/  */ /g' | cut -d ' ' -f4- | sed 's/, load.*$//g' | rev | cut -d ',' -f2- | rev )"
    printSystemInfoLine "      Load AVG" "$(uptime | sed 's/  */ /g' | cut -d ' ' -f4- | sed 's/^.*load average: //g' )"
    printSystemInfoLine "  Temperatures" "$(sensors | grep -E 'Physical id 0' | awk 'BEGIN { FS = " "} { printf "CPU: %s\n",$4 }')" # | Mainboard: | GPU1: | GPU2: "
    printSystemInfoLine "          Fans" "$(sensors | grep -E 'fan1' | awk 'BEGIN { FS = " "} { printf "CPU: %s %s\n",$2,$3 }')" # | Front: | Back: " # | GPU1: | GPU2:"
    printSystemInfoLine "           Mem" "$(free -m | grep -E 'Mem' | awk 'BEGIN { FS = " "} { printf "MemFree: %sM / MemTotal: %sM\n",$4,$2 }') | $(free -m | grep -E 'Swap' | awk 'BEGIN { FS = " "} { printf "SwapFree: %sM / SwapTotal: %sM\n",$4,$2 }')"
    printSystemInfoLine "       Disks 1" "$(df -h | grep -E '\/$' | awk 'BEGIN { FS = " "} { printf "RootFree: %s / RootTotal: %s\n",$4,$2 }') | $(df -h | grep -E '\/home$' | awk 'BEGIN { FS = " "} { printf "HomeFree: %s / HomeTotal: %s\n",$4,$2 }')"
#    printSystemInfoLine "       Disks 2" ""
#    printSystemInfoLine "       Disks 3" ""

    printHeaderBottomLine
}

function processVimConfigUpdateCheck()
{
    local URL='http://gitorious.hermann-mayer.net/linux-environment/vim-config.xml'
    local dlBin="`which curl`"

    if [ -z "${dlBin}" ]; then
        dlBin="`which wget`"
    fi

    if [[ "${dlBin}" =~ curl$ ]]; then
        latestPushDate=$(${dlBin} -S -s "${URL}" | egrep "<last-pushed-at" | grep -oP '(?<=>).+(?=<)')
    else
        latestPushDate=$(${dlBin} -q -O - "${URL}" | egrep "<last-pushed-at" | grep -oP '(?<=>).+(?=<)')
    fi

    lastUpdate=$(cat "${BASHRC_LASTUPDATE}")
    latestPushDate=$(date -u -d "`echo ${latestPushDate} | sed 's/Z//g'`" +%s)
    if [ "${latestPushDate}" -gt "${lastUpdate}" ]; then
        return 1
    fi

    return 0
}

function checkVimConfigForUpdates()
{
    LOGPATH="/tmp/.bashrc-`whoami`"
    FILE="$LOGPATH/.lastcheck"

    if [ ! -f "${BASHRC_LASTUPDATE}" ]; then
        date +%s > "${BASHRC_LASTUPDATE}"
    fi

    if [ ! -f "$FILE" ]; then
        mkdir -p "$LOGPATH" 2>&1 > /dev/null
        date +%s > "$FILE"
        # echo 'Update the first time this session..'
        touch "$FILE"
        processVimConfigUpdateCheck
        return $?
    else
        found=$(find "$LOGPATH" -name ".lastcheck" -mmin +360 -exec echo {} \;)
        if [ -n "$found" ]; then
            # echo 'Last Update was 6h ago..'
            touch "$FILE"
            processVimConfigUpdateCheck
            return $?
        fi
    fi
}

# /**
#  * printLogo
#  *
#  * @access public
#  * @return void
#  */
function printLogo()
{
    #checkVimConfigForUpdates
    #updateFound=$?
    updateFound=1
    #lastUpdate=$(cat "${BASHRC_LASTUPDATE}" | xargs -I '{}' date -u -d "@{}" --rfc-3339=date)

    sw[1]=" ___ _        _ _  __      __  For those who do."
    sw[2]="/ __| |_  ___| | | \ \    / /__ _ _|‾|_____ _ _ "
    sw[3]="\__ \ ' \/ -_) | |  \ \/\/ / _ \ '_| / / -_) '_|"
    sw[4]="|___/_||_\___|_|_|   \_/\_/\___/_| |_\_\___|_|  "
    sw[5]="                                                "
    sw[6]="Power-Shell provided by Tobias Dittmann <research@man-behind-moon.com>"
    sw[7]="                                         "
    sw[8]="Last Update: ${lastUpdate} — Version: ${ZSHRC_VERSION}"

    if [ $updateFound -eq 1 ]; then
        sw[9]="=> New update available! (zshrc --update)"
    fi

    count=1

    for l in "${sw[@]}"; do

        if [ $(( $count % 2 )) = 1 ]; then
            bg="\e[1;37;48;5;52m"
        else
            bg="\e[1;37;48;5;88m"
        fi

        #if [ "$TERM" = 'linux' ]; then
        #    bg=$bakred
        #fi

        # Overwrite l with value
	#echo $l
        #l="${sw[$l]}"

        (( count++ ))
        len=${#l}
        sPos=$(( $COLUMNS - $len - 1 ))

        printToPos $count $sPos "$(echo -e "${bldwht}${bg}${l}")"
    done
}

#if [ "${1}" != '--no-run' ]; then
    if [ "$PRINT_HEADER" -ne 0 ]; then
        printSystemInfo
        printLogo
        #if [ "$COLORTERM" = 'kmscon' ]; then
        #    echo -e "\n\n"
        #fi
    fi
#fi

