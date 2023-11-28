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

if [ "$need_param" == "y" ]; then
    read -p "Input your nuclei param: " nuclei_param
fi

# Menjalankan Subfinder untuk mendapatkan subdomain
echo "Running subfinder..."
subfinder -d "$domain_name" -o subdomains.txt

echo "Running httpx-toolkit..."
# Menjalankan httpx-toolkit untuk mengecek subdomain yang aktif
httpx-toolkit -l subdomains.txt -o active_domains.txt

echo "Scanning domain completed!"
echo "--------------------------"
# Menampilkan jumlah domain aktif dan tidak aktif
total_active_domains=$(wc -l < active_domains.txt)
total_subdomains=$(wc -l < subdomains.txt)
total_inactive_domains=$((total_subdomains - total_active_domains))

echo "Total Active Domains: $total_active_domains"
echo "Total Inactive Domains: $total_inactive_domains"
echo "----------------------------------------------"
# Menanyakan apakah pengguna ingin menjalankan Nuclei
read -p "Do you want to run Nuclei? (y/n): " run_nuclei

if [ "$run_nuclei" == "y" ]; then
    echo "Running nuclei..."
    
    # Menanyakan apakah perlu parameter untuk Nuclei
    read -p "Need parameter for nuclei? (y/n): " need_param
    
    if [ "$need_param" == "y" ]; then
        nuclei -l active_domains.txt -o nuclei_report.txt "$nuclei_param"
        #subfinder -d "$domain_name" -o subdomains.txt | httpx-toolkit -o active_domains.txt | nuclei "$nuclei_param" -o nuclei_report.txt
    else
        nuclei -l active_domains.txt -o nuclei_report.txt
        #subfinder -d "$domain_name" -o subdomains.txt | httpx-toolkit -o active_domains.txt | nuclei -o nuclei_report.txt
    fi
else
    echo "Skipping Nuclei."
fi
