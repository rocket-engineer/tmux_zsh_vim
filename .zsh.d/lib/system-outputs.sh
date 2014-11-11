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

    tll=$(lastlog -u "$USER" | tail -1 | sed 's/  */ /g' | cut -d ' ' -f2-)
    lastLog=$(echo "$tll" | rev | cut -d ' ' -f1-6 | rev)
    temp_cpu=$(sensors | grep -E 'Physical id 0' | cut -c17-24)
    temp_gpu=$(nvidia-smi -q -d TEMPERATURE | grep "GPU Current Temp" | cut -c39-40).0$(echo -e '\u00B0'C)
    fan_cpu1=$(sensors | grep -E 'fan2' | cut -c24-31)
    fan_cpu2=$(sensors | grep -E 'fan6' | cut -c24-31)
    fan_gpu=$(nvidia-smi -i 0 -q | grep "Fan Speed" | cut -c39-42)
    fan_front1=$(sensors | grep -E 'fan3' | cut -c24-31)
    fan_front2=$(sensors | grep -E 'fan5' | cut -c24-31)
    fan_front3=$(sensors | grep -E 'fan1' | cut -c24-31)
    fan_back=$(sensors | grep -E 'fan4' | cut -c24-31)
    mem_free=$(free -m | grep "Mem:" | cut -c36-40)
    mem_total=$(free -m | grep "Mem:" | cut -c14-18)
    swap_free=$(free -m | grep "Swap:" | cut -c36-40)
    swap_total=$(free -m | grep "Swap:" | cut -c14-18)
    disk_root_free=$(df -h | grep "/vg_ssd1-lv_root" | cut -c44-48)
    disk_root_total=$(df -h | grep "/vg_ssd1-lv_root" | cut -c32-36)
    disk_home_free=$(df -h | grep "/dev/sdb1" | cut -c44-48)
    disk_home_total=$(df -h | grep "/dev/sdb1" | cut -c32-36)
    disk_data_free=$(df -h | grep "/vg_hdd2-lv_data" | cut -c44-48)
    disk_data_total=$(df -h | grep "/vg_hdd2-lv_data" | cut -c32-36)
    disk_backup_free=$(df -h | grep "/vg_hdd2-lv_backup" | cut -c44-48)
    disk_backup_total=$(df -h | grep "/vg_hdd2-lv_backup" | cut -c32-36)
    disk_scratch_free=$(df -h | grep "/vg_ssd1-lv_scratch" | cut -c44-48)
    disk_scratch_total=$(df -h | grep "/vg_ssd1-lv_scratch" | cut -c32-36)

    printSystemInfoLine "    Last Login" "$lastLog"
    printSystemInfoLine "          Time" "$(date) (Unix-Timestamp: $(date +%s))"
    printSystemInfoLine "     Processes" "${USER}'s: $(ps aux | grep $USER | wc -l) / Total: $(ps aux | wc -l)"
    printSystemInfoLine "        Uptime" "$(uptime | sed 's/  */ /g' | cut -d ' ' -f4- | sed 's/, load.*$//g' | rev | cut -d ',' -f2- | rev )"
    printSystemInfoLine "      Load AVG" "$(uptime | sed 's/  */ /g' | cut -d ' ' -f4- | sed 's/^.*load average: //g' )"
    printSystemInfoLine "  Temperatures" "$(printf "CPU: %s" "$temp_cpu") | $(\
                                            printf "GPU: +%s" "$temp_gpu")"
    printSystemInfoLine "        Fans 1" "$(printf "CPU1:   %s" "$fan_cpu1") | $(\
                                            printf "CPU2:   %s" "$fan_cpu2") | $(\
                                            printf "GPU: +%s" "$fan_gpu")"
    printSystemInfoLine "        Fans 2" "$(printf "Front1: %s" "$fan_front1") | $(\
                                            printf "Front2: %s" "$fan_front2") | $(
                                            printf "Front3: %s" "$fan_front3") | $(
                                            printf "Back: %s" "$fan_back")"
    printSystemInfoLine "        Memory" "$(printf "MemFree: %sM / MemTotal: %sM" "$mem_free" \
                                                                                  "$mem_total") | $(\
                                            printf "SwapFree: %sM / SwapTotal: %sM" "$swap_free" \
                                                                                    "$swap_total")"
    printSystemInfoLine "       Disks 1" "$(printf "RootFree: %s / RootTotal: %s\n" "$disk_root_free" \
                                                                                    "$disk_root_total") | $(\
                                            printf "BackupFree:  %s / BackupTotal:  %s\n" "$disk_backup_free" \
                                                                                        "$disk_backup_total")"
    printSystemInfoLine "       Disks 2" "$(printf "HomeFree: %s / HomeTotal: %s\n" "$disk_home_free" \
                                                                                    "$disk_home_total") | $(\
                                            printf "ScratchFree: %s / ScratchTotal: %s\n" "$disk_scratch_free" \
                                                                                          "$disk_scratch_total")"
    printSystemInfoLine "       Disks 3" "$(printf "DataFree: %s / DataTotal: %s\n" "$disk_data_free" \
                                                                                    "$disk_data_total")"

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
    sw[8]="                                         "
    sw[9]="Last Update: ${lastUpdate} — Version: ${ZSHRC_VERSION}"

    if [ $updateFound -eq 1 ]; then
        sw[10]="=> New update available! (zshrc --update)"
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

