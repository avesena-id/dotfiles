#!/bin/bash

# Warna Maksimal Minimalis & Monochrome
BLANK='#00000000'         # Transparan
BACKGROUND='#00000000'     # Transparan (mengikuti blur)
TEXT='#FFFFFFFF'           # Putih Bersih
FOREGROUND='#FFFFFF22'     # Putih Transparan Ringan
WRONG='#FFFFFF88'          # Abu-abu Terang (jika salah password)
VERIFY='#FFFFFFFF'         # Putih Bersih (saat memverifikasi)

i3lock \
--insidever-color=$BLANK \
--ringver-color=$VERIFY \
\
--insidewrong-color=$BLANK \
--ringwrong-color=$WRONG \
\
--inside-color=$BLANK \
--ring-color=$FOREGROUND \
--line-color=$BLANK \
--separator-color=$BLANK \
\
--verif-color=$TEXT \
--wrong-color=$WRONG \
--layout-color=$TEXT \
--date-color=$TEXT \
--time-color=$TEXT \
\
--screen=1 \
--blur=8 \
--clock \
--indicator \
--time-str="%H:%M:%S" \
--date-str="%Y-%m-%d" \
--ring-width=4 \
--radius=90 \
--verif-text="Checking..." \
--wrong-text="Wrong." \
--noinput-text=""
