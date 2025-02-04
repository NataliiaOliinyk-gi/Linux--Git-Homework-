#!/bin/bash
#
USER=Nataliia

date

echo hello $USER!

echo Скрипт запущен из директории $(pwd)

ps -ef | grep -w sshd | grep -v grep | wc -l

ls -la /etc/passwd | awk '{print $1}'

