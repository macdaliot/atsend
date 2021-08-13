#! /bin/bash
# Author: Jonathan Scott
# Date: 10/2/2017
#
# Description:
# Find the available modem /dev/cu ports on MacOS
# Dependencies: Python2 and 3, gsmterm.py
# Installation:
# pip3 install python-gsmmodem-new
# pip3 install pyserial
#
# For: Jonathan Scott - 2017
# Updated: 08/12/2021
# I am having to update this code, because it is the year 2021, and its pretty cool that my code lasted 5 years
# The python serial module I was using to list out the comports is not retired, but its time to update!
# I will be using python 3.9, project io2.sh has also been updated, but now I will need to clean up the sloppy 5 year old
# code I wrote, so here we go


    modem_list_upgrade=$(python3 -m serial.tools.list_ports -v | sed 'N;N;s/\n/ /g')

        sessionid=$(uuidgen)
        modem=$(ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*\|cu.lgusbmodem*" | head -1 | awk '{print $NF}')
        modem_count=$(ls -A /dev/* | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*\|cu.lgusbmodem*" | wc -l | sed 's/^[ \t]*//')
        modem_list=$(echo "${modem_list_upgrade}" | sed '/Bluetooth/d;/AirPods/d' | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*\|cu.lgusbmodem*")
        modem_list_tmp=$(echo "${modem_list_upgrade}" | sed '/Bluetooth/d;/AirPods/d' | grep -e "cu.usbmodem*\|cu.SAMSUNG_MDM*\|cu.lgusbmodem*" > /tmp/modem_list.txt)

        AT_LOGS=LOGS
        
        if [ ! -d ${AT_LOGS} ]; then
        mkdir ${AT_LOGS}
        fi

        if [ ! -d ${AT_LOGS}/${sessionid} ]; then
            mkdir ${AT_LOGS}/${sessionid}
        fi
        
        echo "${modem_list_tmp}"

        mdm_cnt_logic(){

            if [[ ${modem_count} -eq 1 ]]; then
                echo "[${modem_count}] Modem Found: ${modem_list}"
            elif [[ ${modem_count} -gt 1 ]]; then
                echo "[${modem_count}] Modems Found: "
            # i'm doing a while loop to make sure that each modem present has its own line for the modem location
            # I'm saving ${modem_list} to a temp dir so that I can read each line the the wile loop
                while read line ; do
                    echo "Modem Location: ${line}"
                done < /tmp/modem_list.txt

            else [[ ${modem_count} -eq 0 ]]
                echo "No Modem Found: Check Your Connection or Restart The Device."
            fi

        }

        mdm_cnt_logic=$(mdm_cnt_logic)


            if [[ ${modem_count} -ge 1 ]]; then
                echo ""
                echo "---------------------------------------------------------------------------------------------------------------------------------------------"
                echo "${mdm_cnt_logic}"
                echo "---------------------------------------------------------------------------------------------------------------------------------------------"
                echo ""

                gsmterm.py ${modem} | tee ${AT_LOGS}/${sessionid}/at_log.log 

            else [[ ${modem_count} -eq 0 ]];

                echo "---------------------------------------------------------------------------------------------------------------------------------------------"
                echo "${mdm_cnt_logic}"
                echo "---------------------------------------------------------------------------------------------------------------------------------------------"

            fi

