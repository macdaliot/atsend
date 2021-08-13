#! /bin/bash
# Author: Jonathan Scott
# Date: 08/12/2021
#
# Description:
# Find the available modem ttyUSB or ttyACM ports on Linux Distributions.
# Dependencies: Python2, pip2

wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python2 get-pip.py
pip2 install python-gsmmodem
pip3 install pyserial
rm -f get-pip.py
sudo reboot