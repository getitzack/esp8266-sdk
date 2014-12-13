#!/bin/sh

BINDIR=../esp_iot_sdk/bin
TOOLDIR=${BINDIR}/../tools
ESPTOOL=../esptool/esptool.py
TTY=/dev/ttyUSB0
${ESPTOOL} make_image \
	--segfile ${BINDIR}/eagle.app.v6.flash.bin --segaddr 0x00000 \
	--segfile ${BINDIR}/eagle.app.v6.irom0text.bin --segaddr 0x40000 \
	--entrypoint 0x00000 \
	app.image

#${ESPTOOL} --port ${TTY} write_flash 0x00000 app.image
${ESPTOOL} --port ${TTY} write_flash 0x00000 ${BINDIR}/eagle.app.v6.flash.bin
${ESPTOOL} --port ${TTY} write_flash 0x40000 ${BINDIR}/eagle.app.v6.irom0text.bin

