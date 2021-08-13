# ATSEND
### Author: Jonathan Scott  @jonathandata1
![ATSEND - Modem Commands To Cellphones With Instant Response](https://i.postimg.cc/hvGbSPZp/atsend.gif)
### CURRENT VERSION 1.0

# Availability
- MacOS
- Linux Distro's
- Windows (Coming Soon)

# NOTE: 
> #### If you previously intalled python-gsmmodem-new uninstall it with 
- pip3 uninstall python-gsmmodem-new
> #### If you previously intalled python-gsmmodem uninstall it with 
- pip3 uninstall python-gsmmodem
> #### If you previously intalled pyserial uninstall it with 
- pip3 uninstall pyserial

TO CLOSE or Exit AT SEND Program PRESS CONTROL+D For All Operating Systems


# Dependencies
		You can install the following manually or run the install script that is inside the folder of the OS you are wanting to install on
		
		1. wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
		2. python2 get-pip.py
		3. pip2 install python-gsmmodem
		4. pip3 install pyserial
		5. rm -f get-pip.py
		6. sudo reboot
		
		LG Modem Drivers
			MacOS and Windows Have The Drivers Folder and Drivers to Install
			Source: LG Universal Mobile Drivers
			https://www.lg.com/us/support/software-firmware-drivers
		Linux Does Not Require LG Drivers
		
# Example AT Commands You Can Send

- AT+GMM
- AT+SERIALNO
- AT+DEVCONINFO
- AT+CFUN=1,1
- AT$QCCLAC 



