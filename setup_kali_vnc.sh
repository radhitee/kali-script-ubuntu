#!/bin/bash

# Pembaruan dan Peningkatan
echo "Mengecek pembaruan dan peningkatan..."
sudo apt update && sudo apt upgrade -y

# Instalasi VNC Server
echo "Memulai instalasi VNC Server..."
sudo apt install xfce4 xfce4-goodies tightvncserver -y


echo "Memulai instalasi Kali GUI..."
# Instalasi Kali GUI
apt install gnome-core kali-defaults kali-root-login desktop-base

echo "Instalasi selesai."

# 1. Running VNC Server
#tightvncserver -geometry 1024x768

# - Install Netstat jika diperlukan untuk mencari port yang digunakan
#apt install net-tools

# 2. Jalankan perintah netstat untuk melihat port yang sedang dipakai VNC Server
#netstat -tulpn

# 3. Jalankan tunnel di local PC kita untuk memulai (asumsi port yang digunakan 5903 dari hasil netstat diatas
#ssh -L 5903:localhost:5903 -N -f kali@xxx.xxx.xxx

# 4. Pakai VNC Viewer di local PC kita dan masukan localhost:5903 lalu masukan password saat setup pada point 1
