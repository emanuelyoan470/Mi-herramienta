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
echo -e "${AMARILLO}        [ BLOCK PHONE GENERATOR ]${NC}\n"

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
# FUNCIÓN: GENERAR HTML DE BLOQUEO
# ============================================
generar_block() {
    local app="$1"
    local codigo="$2"
    
    mkdir -p ~/storage/downloads/block_pages
    
    # NOMBRE DEL ARCHIVO
    ARCHIVO="~/storage/downloads/block_pages/${app}_block.html"
    
    cat > "$ARCHIVO" << EOF
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🔒 $app - BLOQUEADO</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #CC0000;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }
        .container {
            background: #FF0000;
            padding: 40px;
            border-radius: 20px;
            width: 400px;
            text-align: center;
            border: 5px solid #FFFFFF;
            box-shadow: 0 0 50px rgba(255,0,0,0.8);
            animation: pulse 1s infinite;
        }
        @keyframes pulse {
            0% { box-shadow: 0 0 50px rgba(255,0,0,0.8); }
            50% { box-shadow: 0 0 100px rgba(255,0,0,0.4); }
            100% { box-shadow: 0 0 50px rgba(255,0,0,0.8); }
        }
        .icono { font-size: 80px; margin-bottom: 10px; }
        h1 {
            color: #FFFFFF;
            font-size: 32px;
            font-weight: bold;
            text-shadow: 0 0 20px rgba(255,255,255,0.3);
        }
        .subtitle {
            color: #FFFF00;
            font-size: 16px;
            margin: 10px 0 20px 0;
        }
        .mensaje {
            color: #FFFFFF;
            font-size: 14px;
            margin-bottom: 20px;
        }
        input {
            width: 100%;
            padding: 15px;
            font-size: 20px;
            border: none;
            border-radius: 10px;
            text-align: center;
            letter-spacing: 5px;
            background: #FFFFFF;
            color: #000000;
            margin-bottom: 15px;
        }
        input:focus { outline: 2px solid #FFFF00; }
        .btn {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            background: #FF0000;
            color: #FFFFFF;
            cursor: pointer;
            border: 2px solid #FFFFFF;
            transition: all 0.3s;
        }
        .btn:hover {
            background: #CC0000;
            transform: scale(1.02);
        }
        .error {
            color: #FFFF00;
            font-size: 14px;
            margin-top: 10px;
            min-height: 25px;
        }
        .timer {
            color: #FFFFFF;
            font-size: 16px;
            margin-top: 5px;
        }
        .footer {
            color: rgba(255,255,255,0.5);
            font-size: 11px;
            margin-top: 20px;
        }
        .logo-app {
            font-size: 50px;
            margin-bottom: 10px;
        }
        .nombre-app {
            color: #FFFFFF;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo-app">⚠️</div>
    <h1>¡TE HACKEAMOS!</h1>
    <div class="subtitle">🔒 DISPOSITIVO BLOQUEADO 🔒</div>
    <div class="nombre-app">📱 $app</div>
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

    echo -e "${VERDE}[✔] Página generada: ${AMARILLO}$ARCHIVO${NC}"
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
    echo -e "${AMARILLO}        [ BLOCK PHONE GENERATOR ]${NC}\n"
    
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
                echo -e "${ROJO}[!] Código inválido. Debe ser de 4 dígitos (1000-9999).${NC}"
            fi
        done
        
        generar_block "$APP_SELECCIONADA" "$CODIGO"
        
        echo -e "\n${VERDE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${VERDE}[✔] ¡PÁGINA GENERADA CON ÉXITO!${NC}"
        echo -e "${VERDE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
        echo -e "${BLANCO}[+] App: ${AMARILLO}$APP_SELECCIONADA${NC}"
        echo -e "${BLANCO}[+] Archivo: ${AMARILLO}~/storage/downloads/block_pages/${APP_SELECCIONADA}_block.html${NC}"
        echo -e "${BLANCO}[+] Código: ${VERDE}$CODIGO${NC}"
        echo -e "\n${BLANCO}[*] Cómo usar:${NC}"
        echo -e "  1. Abre el archivo con cualquier navegador"
        echo -e "  2. Verás la pantalla de bloqueo roja"
        echo -e "  3. Ingresa el código: ${VERDE}$CODIGO${NC}"
        echo -e "  4. ¡Se desbloqueará!"
        echo -e "\n${ROJO}[!] ADVERTENCIA:${NC} Solo para fines educativos"
        echo -e "${VERDE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
        
        read -p "Presiona Enter para continuar..."
    else
        echo -e "${ROJO}[!] Opción inválida.${NC}"
        sleep 2
    fi
done
