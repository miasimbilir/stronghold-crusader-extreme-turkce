@echo off
chcp 65001 >nul
title Stronghold Crusader Extreme - Turkce Yama Kurulum
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0kurulum\install.ps1"
