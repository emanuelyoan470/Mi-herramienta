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
echo "   ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ "
echo "   ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗"
echo "   ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝"
echo "   ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗"
echo "   ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║"
echo "   ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝"
echo -e "${AMARILLO}        [ MULTI-APP WEB SERVER DEPLOYER ]${NC}\n"

# ==========================================
# LISTA DE 100+ APLICACIONES Y JUEGOS
# ==========================================
APPS=(
    "Roblox" "Free Fire" "TikTok" "Minecraft" "PUBG Mobile" "Call of Duty" "Fortnite" "Brawl Stars"
    "Clash Royale" "Clash of Clans" "Instagram" "WhatsApp" "Facebook" "YouTube" "Twitch" "Discord"
    "Spotify" "Netflix" "Steam" "PlayStation Network" "Xbox Live" "Nintendo Online" "League of Legends" "Valorant"
    "Genshin Impact" "Honkai Star Rail" "EA Sports FC" "FIFA Mobile" "eFootball" "Rocket League" "Fall Guys" "Among Us"
    "Stumble Guys" "Subway Surfers" "Candy Crush" "Clash of Lords" "Mobile Legends" "Arena of Valor" "Pokémon GO" "Apex Legends"
    "Cyberpunk" "GTA V" "Red Dead" "Elden Ring" "Overwatch" "CS:GO 2" "Dota 2" "Terraria"
    "Roblox Studio" "CapCut" "PicsArt" "Canva" "Pinterest" "Snapchat" "Telegram" "Reddit"
    "X (Twitter)" "Threads" "LinkedIn" "Duolingo" "Shazam" "SoundCloud" "Deezer" "Amazon"
    "Mercado Libre" "eBay" "AliExpress" "Shein" "Temu" "PayPal" "Binance" "Trust Wallet"
    "Metamask" "Google Play" "App Store" "Epic Games" "Riot Games" "Battle.net" "Ubisoft Connect" "EA App"
    "Crunchyroll" "HBO Max" "Disney+" "Prime Video" "Paramount+" "Apple Music" "Tidal" "VLC"
    "CapCut Pro" "Lightroom" "Photoshop" "Illustrator" "Blender" "Unity" "Unreal Engine" "Godot"
    "VS Code" "Github" "Gitlab" "Termux" "Linux" "Windows" "Android" "iOS"
)

echo -e "${BLANCO}[+] Lista de módulos disponibles (${#APPS[@]} en total):${NC}\n"

# Mostrar lista formateada en columnas
for i in "${!APPS[@]}"; do
    num=$((i+1))
    printf "  ${AMARILLO}[%3d]${NC} %-22s" "$num" "${APPS[$i]}"
    if [ $((num % 3)) -eq 0 ]; then
        echo ""
    fi
done
echo -e "\n"

# ==========================================
# SELECCIÓN DE APLICACIÓN
# ==========================================
read -p ">> Selecciona un número (1-${#APPS[@]}): " app_choice

if [[ ! "$app_choice" =~ ^[0-9]+$ ]] || [ "$app_choice" -lt 1 ] || [ "$app_choice" -gt "${#APPS[@]}" ]; then
    echo -e "${ROJO}[!] Selección no válida.${NC}"
    exit 1
fi

SELECTED_APP="${APPS[$((app_choice-1))]}"
echo -e "${VERDE}[✔] Módulo seleccionado: $SELECTED_APP${NC}\n"

# ==========================================
# SELECCIÓN DE MODO DE RED
# ==========================================
echo -e "${BLANCO}[+] Selecciona el alcance de red:${NC}"
echo -e "  ${AMARILLO}[1]${NC} Red Local (Accesible en tu Wi-Fi)"
echo -e "  ${AMARILLO}[2]${NC} Servidor Local de Prueba (Localhost)"
read -p ">> Selecciona modo (1-2): " net_choice

# ==========================================
# GENERACIÓN DE PÁGINA EN BLANCO Y SERVIDOR
# ==========================================
mkdir -p ~/mi_web

cat << HTML > ~/mi_web/index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>$SELECTED_APP - Servidor</title>
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

if [ "$net_choice" == "1" ]; then
    IP_LOCAL=$(ifconfig 2>/dev/null | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n 1)
    echo -e "${BLANCO}Enlace local generado:${NC}"
    echo -e "${AMARILLO}  http://localhost:8080${NC}"
    if [ -n "$IP_LOCAL" ]; then
        echo -e "${AMARILLO}  http://$IP_LOCAL:8080${NC} (Para dispositivos en tu misma red Wi-Fi)"
    fi
else
    echo -e "${BLANCO}Enlace generado:${NC}"
    echo -e "${AMARILLO}  http://localhost:8080${NC}"
fi

echo -e "\n${BLANCO}Presiona Ctrl+C para finalizar la ejecución.${NC}\n"
cd ~/mi_web && python3 -m http.server 8080
