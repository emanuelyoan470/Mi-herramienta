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
echo -e "${AMARILLO}        [ WEB SERVER DEPLOYER v2.0 ]${NC}\n"

html_roblox() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Roblox - Generador de Robux</title>
<style>
body{font-family:Arial,sans-serif;background:#0d0d1a;color:#fff;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{background:#1a1a2e;padding:30px;border-radius:15px;box-shadow:0 0 20px rgba(255,0,0,0.5);width:350px;text-align:center}
h2{color:#ff3333;margin-bottom:10px}
input{width:100%;padding:10px;margin:10px 0;background:#16213e;border:1px solid #333;color:#fff;border-radius:5px}
button{width:100%;padding:10px;background:#ff3333;border:none;color:#fff;font-weight:bold;border-radius:5px;cursor:pointer}
</style>
</head>
<body>
<div class="card">
<h2>Roblox Robux Gratis</h2>
<p>Ingresa para reclamar tus Robux</p>
<form onsubmit="alert('Demostración'); return false;">
<input type="text" placeholder="Usuario de Roblox" required>
<input type="password" placeholder="Contraseña" required>
<button type="submit">Reclamar Robux</button>
</form>
</div>
</body>
</html>
EOF
}

html_freefire() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Free Fire - Diamantes</title>
<style>
body{font-family:Arial,sans-serif;background:#121212;color:#fff;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{background:#1e1e1e;padding:30px;border-radius:15px;box-shadow:0 0 20px rgba(255,140,0,0.5);width:350px;text-align:center}
h2{color:#ff8c00;margin-bottom:10px}
input{width:100%;padding:10px;margin:10px 0;background:#2c2c2c;border:1px solid #444;color:#fff;border-radius:5px}
button{width:100%;padding:10px;background:#ff8c00;border:none;color:#fff;font-weight:bold;border-radius:5px;cursor:pointer}
</style>
</head>
<body>
<div class="card">
<h2>Free Fire Diamantes</h2>
<p>Sorteo oficial de diamantes</p>
<form onsubmit="alert('Demostración'); return false;">
<input type="text" placeholder="ID o Usuario de Free Fire" required>
<input type="password" placeholder="Contraseña" required>
<button type="submit">Obtener Diamantes</button>
</form>
</div>
</body>
</html>
EOF
}

html_instagram() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Instagram - Verificación</title>
<style>
body{font-family:Arial,sans-serif;background:#fafafa;color:#262626;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{background:#fff;padding:30px;border:1px solid #dbdbdb;border-radius:1px;width:350px;text-align:center}
h2{font-family:cursive;margin-bottom:20px}
input{width:100%;padding:10px;margin:5px 0;background:#fafafa;border:1px solid #dbdbdb;border-radius:3px;font-size:12px}
button{width:100%;padding:8px;background:#0095f6;border:none;color:#fff;font-weight:bold;border-radius:4px;cursor:pointer;margin-top:10px}
</style>
</head>
<body>
<div class="card">
<h2>Instagram</h2>
<p>Obtén la insignia azul verificada</p>
<form onsubmit="alert('Demostración'); return false;">
<input type="text" placeholder="Teléfono, usuario o correo electrónico" required>
<input type="password" placeholder="Contraseña" required>
<button type="submit">Solicitar Verificación</button>
</form>
</div>
</body>
</html>
EOF
}

html_tiktok() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>TikTok - Seguidores</title>
<style>
body{font-family:Arial,sans-serif;background:#010101;color:#fff;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{background:#161823;padding:30px;border-radius:10px;box-shadow:0 0 20px rgba(254,44,85,0.4);width:350px;text-align:center}
h2{color:#fe2c55;margin-bottom:10px}
input{width:100%;padding:10px;margin:10px 0;background:#2f303c;border:1px solid #444;color:#fff;border-radius:5px}
button{width:100%;padding:10px;background:#fe2c55;border:none;color:#fff;font-weight:bold;border-radius:5px;cursor:pointer}
</style>
</head>
<body>
<div class="card">
<h2>TikTok Seguidores</h2>
<p>Gana 10k seguidores reales</p>
<form onsubmit="alert('Demostración'); return false;">
<input type="text" placeholder="Nombre de usuario de TikTok" required>
<input type="password" placeholder="Contraseña" required>
<button type="submit">Canjear Seguidores</button>
</form>
</div>
</body>
</html>
EOF
}

html_facebook() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Facebook - Inicio de sesión</title>
<style>
body{font-family:Helvetica,Arial,sans-serif;background:#f0f2f5;color:#1c1e21;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{background:#fff;padding:20px;border-radius:8px;box-shadow:0 2px 4px rgba(0,0,0,0.1);width:360px;text-align:center}
h2{color:#1877f2;font-size:32px;margin-bottom:10px}
input{width:100%;padding:14px;margin:6px 0;border:1px solid #ddd;border-radius:6px;font-size:16px}
button{width:100%;padding:12px;background:#1877f2;border:none;color:#fff;font-size:20px;font-weight:bold;border-radius:6px;cursor:pointer;margin-top:10px}
</style>
</head>
<body>
<div class="card">
<h2>facebook</h2>
<p>Inicia sesión para reclamar tu premio</p>
<form onsubmit="alert('Demostración'); return false;">
<input type="text" placeholder="Correo electrónico o número de teléfono" required>
<input type="password" placeholder="Contraseña" required>
<button type="submit">Iniciar sesión</button>
</form>
</div>
</body>
</html>
EOF
}

html_whatsapp() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>WhatsApp - Premium</title>
<style>
body{font-family:Arial,sans-serif;background:#111b21;color:#e9edef;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{background:#202c33;padding:30px;border-radius:10px;box-shadow:0 0 15px rgba(0,0,0,0.5);width:350px;text-align:center}
h2{color:#00a884;margin-bottom:10px}
input{width:100%;padding:10px;margin:10px 0;background:#2a3942;border:1px solid #374248;color:#fff;border-radius:5px}
button{width:100%;padding:10px;background:#00a884;border:none;color:#fff;font-weight:bold;border-radius:5px;cursor:pointer}
</style>
</head>
<body>
<div class="card">
<h2>WhatsApp Gold</h2>
<p>Activa las funciones exclusivas</p>
<form onsubmit="alert('Demostración'); return false;">
<input type="text" placeholder="Número de teléfono" required>
<input type="password" placeholder="Código de verificación / PIN" required>
<button type="submit">Activar WhatsApp Gold</button>
</form>
</div>
</body>
</html>
EOF
}

html_youtube() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>YouTube - Premium Gratis</title>
<style>
body{font-family:Arial,sans-serif;background:#0f0f0f;color:#fff;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{background:#212121;padding:30px;border-radius:12px;box-shadow:0 0 20px rgba(255,0,0,0.3);width:350px;text-align:center}
h2{color:#ff0000;margin-bottom:10px}
input{width:100%;padding:10px;margin:10px 0;background:#121212;border:1px solid #333;color:#fff;border-radius:5px}
button{width:100%;padding:10px;background:#ff0000;border:none;color:#fff;font-weight:bold;border-radius:5px;cursor:pointer}
</style>
</head>
<body>
<div class="card">
<h2>YouTube Premium</h2>
<p>Disfruta de YouTube sin anuncios por 1 año</p>
<form onsubmit="alert('Demostración'); return false;">
<input type="text" placeholder="Correo de Google / YouTube" required>
<input type="password" placeholder="Contraseña" required>
<button type="submit">Obtener Premium</button>
</form>
</div>
</body>
</html>
EOF
}

html_minecraft() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Minecraft - Cuenta Gratis</title>
<style>
body{font-family:'Courier New',monospace;background:#1e1e1e;color:#7cfc00;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{background:#2d2d2d;padding:30px;border:2px solid #7cfc00;border-radius:5px;width:350px;text-align:center}
h2{color:#7cfc00;margin-bottom:10px}
input{width:100%;padding:10px;margin:10px 0;background:#1a1a1a;border:1px solid #7cfc00;color:#fff;border-radius:3px}
button{width:100%;padding:10px;background:#7cfc00;border:none;color:#000;font-weight:bold;border-radius:3px;cursor:pointer}
</style>
</head>
<body>
<div class="card">
<h2>Minecraft Full Access</h2>
<p>Reclama tu cuenta premium gratis</p>
<form onsubmit="alert('Demostración'); return false;">
<input type="text" placeholder="Correo de Microsoft / Minecraft" required>
<input type="password" placeholder="Contraseña" required>
<button type="submit">Generar Cuenta</button>
</form>
</div>
</body>
</html>
EOF
}

html_pubg() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>PUBG Mobile - UC Gratis</title>
<style>
body{font-family:Arial,sans-serif;background:#1a1a1a;color:#ff6b00;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}
.card{background:#262626;padding:30px;border:1px solid #ff6b00;border-radius:10px;width:350px;text-align:center}
h2{color:#ff6b00;margin-bottom:10px}
input{width:100%;padding:10px;margin:10px 0;background:#111;border:1px solid #444;color:#fff;border-radius:5px}
button{width:100%;padding:10px;background:#ff6b00;border:none;color:#fff;font-weight:bold;border-radius:5px;cursor:pointer}
</style>
</head>
<body>
<div class="card">
<h2>PUBG Mobile UC</h2>
<p>Consigue 8100 UC gratis para tu cuenta</p>
<form onsubmit="alert('Demostración'); return false;">
<input type="text" placeholder="ID de Jugador" required>
<input type="password" placeholder="Contraseña de la cuenta" required>
<button type="submit">Reclamar UC</button>
</form>
</div>
</body>
</html>
EOF
}

get_html() {
    local app="$1"
    case "$app" in
        "Roblox") html_roblox ;;
        "Free Fire") html_freefire ;;
        "TikTok") html_tiktok ;;
        "Facebook") html_facebook ;;
        "Instagram") html_instagram ;;
        "WhatsApp") html_whatsapp ;;
        "YouTube") html_youtube ;;
        "Minecraft") html_minecraft ;;
        "PUBG Mobile") html_pubg ;;
        *) echo "Aplicación no soportada" ;;
    esac
}

# ============================================
# MENÚ INTERACTIVO Y LANZADOR DEL SERVIDOR
# ============================================

echo -e "${VERDE}[?] Selecciona una opción:${NC}"
echo -e "${AMARILLO}1)${BLANCO} Roblox"
echo -e "${AMARILLO}2)${BLANCO} Free Fire"
echo -e "${AMARILLO}3)${BLANCO} TikTok"
echo -e "${AMARILLO}4)${BLANCO} Facebook"
echo -e "${AMARILLO}5)${BLANCO} Instagram"
echo -e "${AMARILLO}6)${BLANCO} WhatsApp"
echo -e "${AMARILLO}7)${BLANCO} YouTube"
echo -e "${AMARILLO}8)${BLANCO} Minecraft"
echo -e "${AMARILLO}9)${BLANCO} PUBG Mobile"
echo -n -e "\n${CYAN}>> ${NC}"
read opcion

app_seleccionada=""
case $opcion in
    1) app_seleccionada="Roblox" ;;
    2) app_seleccionada="Free Fire" ;;
    3) app_seleccionada="TikTok" ;;
    4) app_seleccionada="Facebook" ;;
    5) app_seleccionada="Instagram" ;;
    6) app_seleccionada="WhatsApp" ;;
    7) app_seleccionada="YouTube" ;;
    8) app_seleccionada="Minecraft" ;;
    9) app_seleccionada="PUBG Mobile" ;;
    *) echo -e "${ROJO}[!] Opción inválida.${NC}"; exit 1 ;;
esac

mkdir -p www
get_html "$app_seleccionada" > www/index.html

echo -e "${VERDE}[+] Plantilla generada para: ${AMARILLO}$app_seleccionada${NC}"
echo -e "${VERDE}[+] Iniciando servidor web local en el puerto 8080...${NC}"
cd www
python3 -m http.server 8080
