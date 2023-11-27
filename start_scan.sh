#!/bin/bash

echo "----------------------------------------"
echo "      Powered by Radhitee               "
echo "----------------------------------------"

# Meminta nama proyek dari pengguna
read -p "Input your project name: " project_name

# Membuat folder dengan nama proyek yang dimasukkan dan pindah ke dalamnya
mkdir "$project_name"
cd "$project_name" || exit

# Meminta domain yang ingin di-scan
read -p "Input domain to scan: " domain_name

# Menanyakan apakah perlu parameter untuk Nuclei
read -p "Need parameter for nuclei? (y/n): " need_param

if [ "$need_param" == "y" ]; then
    read -p "Input your nuclei param: " nuclei_param
fi

# Menjalankan Subfinder untuk mendapatkan subdomain
#subfinder -d "$domain_name" -o subdomains.txt

# Menjalankan httpx-toolkit untuk mengecek subdomain yang aktif
#httpx-toolkit -l subdomains.txt -o active_domains.txt

# Menjalankan Nuclei untuk melakukan scanning
if [ "$need_param" == "y" ]; then
    #nuclei -l active_domains.txt -o nuclei_report.txt "$nuclei_param"
    subfinder -d "$domain_name" -o subdomains.txt | httpx-toolkit -o active_domains.txt | nuclei -o nuclei_report.txt "$nuclei_param"
else
    #nuclei -l active_domains.txt -o nuclei_report.txt
    subfinder -d "$domain_name" -o subdomains.txt | httpx-toolkit -o active_domains.txt | nuclei -o nuclei_report.txt
fi
