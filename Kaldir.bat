@echo off
chcp 65001 >nul
title Stronghold Crusader Extreme - Turkce Yama Kaldirma
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0kurulum\uninstall.ps1"
