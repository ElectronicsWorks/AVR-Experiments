#
# Based on the Cute-AVR project <https://github.com/eng-mg/CuteAVR>
# Copyright (c) Mohammed Gamal <https://github.com/eng-mg>
# File released under GNU Lesser General Public License v2.1
#
# Modifications by Alex Spataru <https://github.com/alex-spataru>
#

#
# Project configuration
#
CONFIG = ""
TEMPLATE = app

#
# Make options
#
UI_DIR = uic
MOC_DIR = moc
RCC_DIR = qrc
OBJECTS_DIR = obj

#
# Change this to match your AVR microcontroller's part number.
# Please use the exact part number of the mcu and pay attention to the capitalization.
#
MCU = ATmega328P

#
# Set MCU frequency (based on the crystal oscillator of your board)
# The MCU/board configuration that I use runs at 16 MHz.
#
MCU_FREQ = 16000000UL

#
# Specify the serial port to which the programmer is connected
#
linux*:!android {
    UPLOADER_PORT = usb
} win32* {
    UPLOADER_PORT = COM1
}

#
# Set the baudrate of the programmer connection for avrdude
#
UPLOADER_BAUD = 115200

#
# Specify the programmer for avrdude
#
UPLOADER_PROGRAMMER = usbasp

#
# Set the part number of the microcontroller for avrdude (sometimes avrdude uses different
# part number from the actual part number of the microcontroller)
# leave the following line unchanged if the part numbers are equal.
#
UPLOADER_PARTNO = $$MCU

#
# Set optimization level *avr-gcc oprimazation levels can be one of (0, 1, 2, s)*
#
COMPILER_OPTIMATZTION_LEVEL = 1

#
# Set the AVR compiler and avrdude paths
#
linux*:!android {
    UPLOADER_DIR = "/usr/bin"
    AVR_COMPILER_DIR = "/usr/bin"
    exists("/usr/lib/avr") {
       AVR_TOOLCHAIN_DIR = "/usr/lib/avr"
    } else {
       AVR_TOOLCHAIN_DIR = "/usr/avr"
    }
} win32* {
    ARDUINO_TOOLS_DIR = "C:\\Program Files (x86)\\Arduino\\hardware\\tools\\avr"
    UPLOADER_DIR = "$$ARDUINO_TOOLS_DIR\\bin"
    AVR_TOOLCHAIN_DIR = "$$ARDUINO_TOOLS_DIR\\avr"
    AVR_COMPILER_DIR = "$$ARDUINO_TOOLS_DIR\\bin"
} macx* {
    ARDUINO_TOOLS_DIR = "/Applications/Arduino.app/" # Figure it out
    UPLOADER_DIR = "$$ARDUINO_TOOLS_DIR/bin"
    AVR_TOOLCHAIN_DIR = "$$ARDUINO_TOOLS_DIR/avr"
    AVR_COMPILER_DIR = "$$ARDUINO_TOOLS_DIR/bin"
}

#
# Comment the following line (using #) if you don't want to upload the output '.hex' file after building
#
CONFIG += upload_hex

#
# Comment the following line (using #) if you don't care to watch avr programs work
#
#CONFIG += show_progs_excution
