#!/bin/bash
echo '************************************'
echo '** TUNNEL SSH SERVER BASI DI DATI **'
echo '************************************'
read -p 'Username lab: ' user
echo '************************************'
echo Insert password lab and get your tools:
echo phpMyAdmin: https://localhost:20443/phpmyadmin/
echo Home page personale: http://localhost:20080/$user
echo '************************************'
ssh -L23306:basidati:3306 -L20443:basidati:443 -L20080:basidati:80 -L20022:basidati:22 $user@ssh.studenti.math.unipd.it
