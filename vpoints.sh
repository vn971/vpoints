#!/bin/bash
# launches VPoints on linux

# Prequisities:
# 1. wine
# 2. CP1251 locale

# Install CP1251 on Debian derivatives (Ubuntu, Mint,..):
#     echo "ru_RU CP1251" >> /var/lib/locales/supported.d/ru
#     dpkg-reconfigure locales

# Install CP1251 on ArchLinux:
#     echo 'ru_RU.CP1251 CP1251' >> /etc/locale.gen
#     local-gen

LANG=ru_RU.CP1251 LC_ALL=ru_RU.CP1251 wine vpoints.exe
