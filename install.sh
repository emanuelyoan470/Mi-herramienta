#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# COLORES ANSI Y CONFIGURACIÓN
# ==========================================
CYAN='\033[0;36m'
AMARILLO='\033[1;33m'
VERDE='\033[0;32m'
BLANCO='\033[1;37m'
ROJO='\033[0;31m'
NC='\033[0m'

clear

# ==========================================
# BANNER
# ==========================================
echo -e "${CYAN}"
echo "  ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ "
echo "  ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗"
echo "  ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝"
echo "  ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗"
echo "  ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║"
echo "  ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝"
echo -e "${AMARILLO}        [ WEB SERVER DEPLOYER v2.0 ]${NC}\n"

# ==========================================
# LISTA COMPACTA DE 50 APLICACIONES Y JUEGOS
# ==========================================
APPS=(
    "Roblox" "Free Fire" "TikTok" "Facebook" "Instagram"
    "WhatsApp" "YouTube" "Minecraft" "PUBG Mobile" "Call of Duty"
    "Fortnite" "Brawl Stars" "Clash Royale" "Clash of Clans" "Twitch"
    "Discord" "Spotify" "Netflix" "Steam" "PlayStation"
    "Xbox Live" "Nintendo" "LoL" "Valorant" "Genshin Imp."
    "FC Mobile" "eFootball" "Rocket League" "Fall Guys" "Among Us"
    "Stumble Guys" "Subway Surf" "Candy Crush" "Mobile Leg." "Pokémon GO"
    "Apex Legends" "GTA V" "CapCut" "PicsArt" "Canva"
    "Pinterest" "Snapchat" "Telegram" "Reddit" "X (Twitter)"
    "Threads" "Duolingo" "Amazon" "PayPal" "Google Play"
)

echo -e "${BLANCO}[+] Módulos disponibles (${#APPS[@]} en total):${NC}\n"

# Mostrar lista en 4 columnas muy compactas
for i in "${!APPS[@]}"; do
    num=$((i+1))
    printf " ${AMARILLO}[%2d]${NC} %-13s" "$num" "${APPS[$i]}"
    if [ $((num % 4)) -eq 0 ]; then
        echo ""
    fi
done
echo -e "\n"

# ==========================================
# SELECCIÓN DE APLICACIÓN CON VALIDACIÓN
# ==========================================
while true; do
    read -p ">> Selecciona una opción (1-${#APPS[@]}): " app_choice
    if [[ "$app_choice" =~ ^[0-9]+$ ]] && [ "$app_choice" -ge 1 ] && [ "$app_choice" -le "${#APPS[@]}" ]; then
        break
    else
        echo -e "${ROJO}[!] Selección inválida. Ingresa un número de 1 a ${#APPS[@]}.${NC}"
    fi
done

SELECTED_APP="${APPS[$((app_choice-1))]}"
echo -e "${VERDE}[✔] Módulo seleccionado: $SELECTED_APP${NC}\n"

# ==========================================
# SELECCIÓN DE ALCANZE DE RED
# ==========================================
echo -e "${BLANCO}[+] Alcance de red:${NC}"
echo -e "  ${AMARILLO}[1]${NC} Red Local (Wi-Fi) [Por defecto]"
echo -e "  ${AMARILLO}[2]${NC} Localhost (Solo este dispositivo)"
read -p ">> Opción (1-2) [1]: " input_net

net_choice=${input_net:-1}

# ==========================================
# DESPLIEGUE DE PÁGINA EN BLANCO
# ==========================================
mkdir -p ~/mi_web

cat << HTML > ~/mi_web/index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servidor - $SELECTED_APP</title>
    <style>
        body { background-color: #ffffff; margin: 0; padding: 0; }
    </style>
</head>
<body>
</body>
</html>
HTML

pkg install python -y > /dev/null 2>&1

clear
echo -e "${CYAN}==================================================${NC}"
echo -e "${VERDE}[✔] SERVIDOR DESPLEGADO PARA: ${BLANCO}$SELECTED_APP${NC}"
echo -e "${CYAN}==================================================${NC}\n"

if [ "$net_choice" == "2" ]; then
    echo -e "${BLANCO}Enlace local:${NC}"
    echo -e "${AMARILLO}  http://localhost:8080${NC}\n"
else
    IP_LOCAL=$(ifconfig 2>/dev/null | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n 1)
    echo -e "${BLANCO}Enlace generado:${NC}"
    echo -e "${AMARILLO}  http://localhost:8080${NC}"
    if [ -n "$IP_LOCAL" ]; then
        echo -e "${AMARILLO}  http://$IP_LOCAL:8080${NC} (Para red Wi-Fi)"
    fi
fi

echo -e "\n${BLANCO}Presiona Ctrl+C para detener el servidor.${NC}\n"
cd ~/mi_web && python3 -m http.server 8080
