# MPLAB IDE generated this makefile for use with GNU make.
# Project: Propeller Clock.mcp
# Date: Thu Jun 01 08:47:44 2017

AS = MPASMWIN.exe
CC = 
LD = mplink.exe
AR = mplib.exe
RM = rm

Propeller\ Clock.cof : Propeller\ Clock.o
	$(CC) /p16F877A "Propeller Clock.o" /u_DEBUG /z__MPLAB_BUILD=1 /z__MPLAB_DEBUG=1 /o"Propeller Clock.cof" /M"Propeller Clock.map" /W

Propeller\ Clock.o : Propeller\ Clock.asm ../../../../../Program\ Files\ (x86)/Microchip/MPASM\ Suite/p16f887.inc
	$(AS) /q /p16F877A "Propeller Clock.asm" /l"Propeller Clock.lst" /e"Propeller Clock.err" /o"Propeller Clock.o" /d__DEBUG=1

clean : 
	$(CC) "Propeller Clock.o" "Propeller Clock.err" "Propeller Clock.lst" "Propeller Clock.cof" "Propeller Clock.hex"

