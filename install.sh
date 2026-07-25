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

# ============================================
# FUNCIONES HTML SEPARADAS Y SANEADAS
# ============================================

html_roblox() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Roblox - Robux Gratis</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(135deg,#1a1a2e,#16213e,#0f3460);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.3);width:400px;text-align:center}
h1{color:#ff6b6b;margin-bottom:10px}
p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(255,215,0,0.1);border:2px solid #ffd700;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ffd700}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,107,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b6b,#ee5a24);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🎮 Gana Robux Gratis</h1>
<p>Inicia sesión y obtén 10,000 Robux</p>
<div class="caja-oferta"><h3>🎁 SORTEO ESPECIAL</h3><p style="color:#fff;">Gana hasta <span style="color:#ffd700;font-weight:bold;">10,000 Robux</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Roblox" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">🎯 Obtener Robux</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
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
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(135deg,#0a0a0a,#1a1a1a,#2a0a0a);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,107,53,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(255,107,53,0.2);width:400px;text-align:center;border:1px solid #ff6b35}
h1{color:#ff6b35;margin-bottom:10px}
p{color:#ffd700;margin-bottom:30px}
.caja-oferta{background:rgba(255,215,0,0.1);border:2px solid #ffd700;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ffd700}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,53,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b35,#ff4500);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🔥 Diamantes GRATIS</h1>
<p>Inicia sesión y recibe 5,000 Diamantes</p>
<div class="caja-oferta"><h3>🎁 EVENTO ESPECIAL</h3><p style="color:#fff;">Gana <span style="color:#ffd700;font-weight:bold;">5,000 Diamantes</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>🎯 ID</label><input type="text" placeholder="ID de Free Fire" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💎 Obtener Diamantes</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
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
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(135deg,#010101,#1a1a1a);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,0,80,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(255,0,80,0.2);width:400px;text-align:center;border:1px solid #ff0050}
h1{color:#ff0050;margin-bottom:10px}
p{color:#fff;margin-bottom:30px}
.caja-oferta{background:rgba(255,0,80,0.1);border:2px solid #ff0050;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff0050}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,0,80,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff0050,#cc0040);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📱 Consigue Seguidores</h1>
<p>Inicia sesión y obtén 10K seguidores</p>
<div class="caja-oferta"><h3>🎁 SORTEO DE SEGUIDORES</h3><p style="color:#fff;">Gana <span style="color:#ff0050;font-weight:bold;">10,000 Seguidores</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de TikTok" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">🚀 Obtener Seguidores</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

html_facebook() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Facebook - Verificación</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#f0f2f5;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:#fff;padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.1);width:400px;text-align:center}
h1{color:#1877f2;margin-bottom:10px}
p{color:#1c1e21;margin-bottom:30px}
.caja-oferta{background:#f0f2f5;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#1877f2}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#1c1e21;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#1877f2;box-shadow:0 0 10px rgba(24,119,242,0.2)}
.btn{width:100%;padding:14px;background:#1877f2;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05);background:#166fe5}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📘 Verifica tu Cuenta</h1>
<p>Obtén el check azul de Facebook</p>
<div class="caja-oferta"><h3>✅ VERIFICACIÓN OFICIAL</h3><p>Consigue el <span style="background:#1877f2;color:#fff;padding:5px 15px;border-radius:20px;font-weight:bold;">✓ Verificado</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Facebook" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">✅ Verificar</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
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
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(45deg,#405de6,#833ab4);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.95);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.3);width:400px;text-align:center}
h1{color:#333;margin-bottom:10px}
p{color:#666;margin-bottom:30px}
.caja-oferta{background:linear-gradient(45deg,#405de6,#833ab4);border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#fff}
.caja-oferta p{color:#fff}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#333;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#405de6;box-shadow:0 0 10px rgba(64,93,230,0.2)}
.btn{width:100%;padding:14px;background:linear-gradient(45deg,#405de6,#833ab4);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📸 Verifica tu Cuenta</h1>
<p>Obtén el check azul de Instagram</p>
<div class="caja-oferta"><h3>✅ VERIFICACIÓN OFICIAL</h3><p>Consigue el <span style="background:#ffd700;color:#000;padding:5px 15px;border-radius:20px;font-weight:bold;">✓ Verificado</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Instagram" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">✅ Verificar</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
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
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#075e54;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.3);width:400px;text-align:center}
h1{color:#fff;margin-bottom:10px}
p{color:#ddd;margin-bottom:30px}
.caja-oferta{background:rgba(37,211,102,0.2);border:2px solid #25d366;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#25d366}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(37,211,102,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:#25d366;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>💬 WhatsApp Premium</h1>
<p>Obtén funciones premium gratis</p>
<div class="caja-oferta"><h3>🎁 PREMIUM GRATIS</h3><p style="color:#fff;">Accede a <span style="color:#25d366;font-weight:bold;">WhatsApp Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>📱 Número</label><input type="text" placeholder="Número de WhatsApp" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💬 Activar Premium</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

html_youtube() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>YouTube - Premium</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#fff;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:#fff;padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.1);width:400px;text-align:center}
h1{color:#ff0000;margin-bottom:10px}
p{color:#333;margin-bottom:30px}
.caja-oferta{background:#f1f1f1;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff0000}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#333;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#ff0000;box-shadow:0 0 10px rgba(255,0,0,0.2)}
.btn{width:100%;padding:14px;background:#ff0000;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>▶️ YouTube Premium</h1>
<p>Disfruta sin anuncios</p>
<div class="caja-oferta"><h3>🎁 PREMIUM GRATIS</h3><p>Obtén <span style="color:#ff0000;font-weight:bold;">YouTube Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de YouTube" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">▶️ Activar Premium</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

html_minecraft() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Minecraft - Cuenta</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Courier New',monospace;background:#2d2d2d;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.5);width:400px;text-align:center;border:2px solid #7cfc00}
h1{color:#7cfc00;margin-bottom:10px}
p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(124,252,0,0.1);border:2px solid #7cfc00;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#7cfc00}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(124,252,0,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:#7cfc00;border:none;border-radius:8px;color:#000;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>⛏️ Minecraft Premium</h1>
<p>Consigue tu cuenta premium</p>
<div class="caja-oferta"><h3>🎁 CUENTA PREMIUM</h3><p style="color:#fff;">Obtén <span style="color:#7cfc00;font-weight:bold;">Minecraft Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Minecraft" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">⛏️ Obtener Cuenta</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

html_pubg() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>PUBG Mobile - UC</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#1a1a1a;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.05);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.5);width:400px;text-align:center;border:1px solid #ff6b00}
h1{color:#ff6b00;margin-bottom:10px}
p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(255,107,0,0.1);border:2px solid #ff6b00;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff6b00}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,0,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b00,#cc5500);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🔫 UC Gratis</h1>
<p>Consigue UC para PUBG</p>
<div class="caja-oferta"><h3>🎁 EVENTO UC</h3><p style="color:#fff;">Gana <span style="color:#ff6b00;font-weight:bold;">10,000 UC</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>🎯 ID</label><input type="text" placeholder="ID de PUBG" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💎 Obtener UC</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

# ============================================
# FUNCIÓN PRINCIPAL DE SELECCIÓN
# ============================================
get_html() {
    local app="$1"
    case "$app" in
        "Roblox") html_roblox ;;
        "Free Fire") html_freefire ;;
        "TikTok") html_tiktok ;;
       .caja-oferta h3{color:#ffd700}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,107,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b6b,#ee5a24);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🎮 Gana Robux Gratis</h1>
<p>Inicia sesión y obtén 10,000 Robux</p>
<div class="caja-oferta"><h3>🎁 SORTEO ESPECIAL</h3><p style="color:#fff;">Gana hasta <span style="color:#ffd700;font-weight:bold;">10,000 Robux</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Roblox" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">🎯 Obtener Robux</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
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
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(135deg,#0a0a0a,#1a1a1a,#2a0a0a);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,107,53,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(255,107,53,0.2);width:400px;text-align:center;border:1px solid #ff6b35}
h1{color:#ff6b35;margin-bottom:10px}
p{color:#ffd700;margin-bottom:30px}
.caja-oferta{background:rgba(255,215,0,0.1);border:2px solid #ffd700;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ffd700}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,53,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b35,#ff4500);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🔥 Diamantes GRATIS</h1>
<p>Inicia sesión y recibe 5,000 Diamantes</p>
<div class="caja-oferta"><h3>🎁 EVENTO ESPECIAL</h3><p style="color:#fff;">Gana <span style="color:#ffd700;font-weight:bold;">5,000 Diamantes</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>🎯 ID</label><input type="text" placeholder="ID de Free Fire" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💎 Obtener Diamantes</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
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
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(135deg,#010101,#1a1a1a);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,0,80,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(255,0,80,0.2);width:400px;text-align:center;border:1px solid #ff0050}
h1{color:#ff0050;margin-bottom:10px}
p{color:#fff;margin-bottom:30px}
.caja-oferta{background:rgba(255,0,80,0.1);border:2px solid #ff0050;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff0050}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,0,80,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff0050,#cc0040);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📱 Consigue Seguidores</h1>
<p>Inicia sesión y obtén 10K seguidores</p>
<div class="caja-oferta"><h3>🎁 SORTEO DE SEGUIDORES</h3><p style="color:#fff;">Gana <span style="color:#ff0050;font-weight:bold;">10,000 Seguidores</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de TikTok" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">🚀 Obtener Seguidores</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

html_facebook() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Facebook - Verificación</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#f0f2f5;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:#fff;padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.1);width:400px;text-align:center}
h1{color:#1877f2;margin-bottom:10px}
p{color:#1c1e21;margin-bottom:30px}
.caja-oferta{background:#f0f2f5;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#1877f2}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#1c1e21;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#1877f2;box-shadow:0 0 10px rgba(24,119,242,0.2)}
.btn{width:100%;padding:14px;background:#1877f2;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05);background:#166fe5}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📘 Verifica tu Cuenta</h1>
<p>Obtén el check azul de Facebook</p>
<div class="caja-oferta"><h3>✅ VERIFICACIÓN OFICIAL</h3><p>Consigue el <span style="background:#1877f2;color:#fff;padding:5px 15px;border-radius:20px;font-weight:bold;">✓ Verificado</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Facebook" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">✅ Verificar</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
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
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(45deg,#405de6,#833ab4);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.95);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.3);width:400px;text-align:center}
h1{color:#333;margin-bottom:10px}
p{color:#666;margin-bottom:30px}
.caja-oferta{background:linear-gradient(45deg,#405de6,#833ab4);border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#fff}
.caja-oferta p{color:#fff}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#333;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#405de6;box-shadow:0 0 10px rgba(64,93,230,0.2)}
.btn{width:100%;padding:14px;background:linear-gradient(45deg,#405de6,#833ab4);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📸 Verifica tu Cuenta</h1>
<p>Obtén el check azul de Instagram</p>
<div class="caja-oferta"><h3>✅ VERIFICACIÓN OFICIAL</h3><p>Consigue el <span style="background:#ffd700;color:#000;padding:5px 15px;border-radius:20px;font-weight:bold;">✓ Verificado</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Instagram" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">✅ Verificar</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
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
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#075e54;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.3);width:400px;text-align:center}
h1{color:#fff;margin-bottom:10px}
p{color:#ddd;margin-bottom:30px}
.caja-oferta{background:rgba(37,211,102,0.2);border:2px solid #25d366;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#25d366}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(37,211,102,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:#25d366;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>💬 WhatsApp Premium</h1>
<p>Obtén funciones premium gratis</p>
<div class="caja-oferta"><h3>🎁 PREMIUM GRATIS</h3><p style="color:#fff;">Accede a <span style="color:#25d366;font-weight:bold;">WhatsApp Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>📱 Número</label><input type="text" placeholder="Número de WhatsApp" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💬 Activar Premium</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

html_youtube() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>YouTube - Premium</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#fff;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:#fff;padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.1);width:400px;text-align:center}
h1{color:#ff0000;margin-bottom:10px}
p{color:#333;margin-bottom:30px}
.caja-oferta{background:#f1f1f1;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff0000}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#333;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#ff0000;box-shadow:0 0 10px rgba(255,0,0,0.2)}
.btn{width:100%;padding:14px;background:#ff0000;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>▶️ YouTube Premium</h1>
<p>Disfruta sin anuncios</p>
<div class="caja-oferta"><h3>🎁 PREMIUM GRATIS</h3><p>Obtén <span style="color:#ff0000;font-weight:bold;">YouTube Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de YouTube" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">▶️ Activar Premium</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

html_minecraft() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Minecraft - Cuenta</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Courier New',monospace;background:#2d2d2d;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.5);width:400px;text-align:center;border:2px solid #7cfc00}
h1{color:#7cfc00;margin-bottom:10px}
p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(124,252,0,0.1);border:2px solid #7cfc00;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#7cfc00}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(124,252,0,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:#7cfc00;border:none;border-radius:8px;color:#000;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>⛏️ Minecraft Premium</h1>
<p>Consigue tu cuenta premium</p>
<div class="caja-oferta"><h3>🎁 CUENTA PREMIUM</h3><p style="color:#fff;">Obtén <span style="color:#7cfc00;font-weight:bold;">Minecraft Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Minecraft" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">⛏️ Obtener Cuenta</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

html_pubg() {
cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>PUBG Mobile - UC</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#1a1a1a;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.05);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.5);width:400px;text-align:center;border:1px solid #ff6b00}
h1{color:#ff6b00;margin-bottom:10px}
p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(255,107,0,0.1);border:2px solid #ff6b00;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff6b00}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,0,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b00,#cc5500);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🔫 UC Gratis</h1>
<p>Consigue UC para PUBG</p>
<div class="caja-oferta"><h3>🎁 EVENTO UC</h3><p style="color:#fff;">Gana <span style="color:#ff6b00;font-weight:bold;">10,000 UC</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>🎯 ID</label><input type="text" placeholder="ID de PUBG" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💎 Obtener UC</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
}

# ============================================
# FUNCIÓN PRINCIPAL DE SELECCIÓN
# ============================================
get_html() {
    local app="$1"
    case "$app" in
        "Roblox") html_roblox ;;
        "Free Fire") html_freefire ;;
        "TikTok") h-bottom:10px}
p{color:#666;margin-bottom:30px}
.caja-oferta{background:linear-gradient(45deg,#405de6,#833ab4);border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#fff}
.caja-oferta p{color:#fff}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#333;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#405de6;box-shadow:0 0 10px rgba(64,93,230,0.2)}
.btn{width:100%;padding:14px;background:linear-gradient(45deg,#405de6,#833ab4);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📸 Verifica tu Cuenta</h1>
<p>Obtén el check azul de Instagram</p>
<div class="caja-oferta"><h3>✅ VERIFICACIÓN OFICIAL</h3><p>Consigue el <span style="background:#ffd700;color:#000;padding:5px 15px;border-radius:20px;font-weight:bold;">✓ Verificado</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Instagram" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">✅ Verificar</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "WhatsApp")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>WhatsApp - Premium</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#075e54;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.3);width:400px;text-align:center}
h1{color:#fff;margin-bottom:10px}
p{color:#ddd;margin-bottom:30px}
.caja-oferta{background:rgba(37,211,102,0.2);border:2px solid #25d366;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#25d366}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(37,211,102,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:#25d366;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>💬 WhatsApp Premium</h1>
<p>Obtén funciones premium gratis</p>
<div class="caja-oferta"><h3>🎁 PREMIUM GRATIS</h3><p style="color:#fff;">Accede a <span style="color:#25d366;font-weight:bold;">WhatsApp Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>📱 Número</label><input type="text" placeholder="Número de WhatsApp" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💬 Activar Premium</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "YouTube")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>YouTube - Premium</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#fff;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:#fff;padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.1);width:400px;text-align:center}
h1{color:#ff0000;margin-bottom:10px}
p{color:#333;margin-bottom:30px}
.caja-oferta{background:#f1f1f1;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff0000}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#333;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#ff0000;box-shadow:0 0 10px rgba(255,0,0,0.2)}
.btn{width:100%;padding:14px;background:#ff0000;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>▶️ YouTube Premium</h1>
<p>Disfruta sin anuncios</p>
<div class="caja-oferta"><h3>🎁 PREMIUM GRATIS</h3><p>Obtén <span style="color:#ff0000;font-weight:bold;">YouTube Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de YouTube" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">▶️ Activar Premium</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "Minecraft")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Minecraft - Cuenta</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Courier New',monospace;background:#2d2d2d;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.5);width:400px;text-align:center;border:2px solid #7cfc00}
h1{color:#7cfc00;margin-bottom:10px}
p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(124,252,0,0.1);border:2px solid #7cfc00;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#7cfc00}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(124,252,0,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:#7cfc00;border:none;border-radius:8px;color:#000;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>⛏️ Minecraft Premium</h1>
<p>Consigue tu cuenta premium</p>
<div class="caja-oferta"><h3>🎁 CUENTA PREMIUM</h3><p style="color:#fff;">Obtén <span style="color:#7cfc00;font-weight:bold;">Minecraft Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Minecraft" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">⛏️ Obtener Cuenta</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "PUBG Mobile")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>PUBG Mobile - UC</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#1a1a1a;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.05);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.5);width:400px;text-align:center;border:1px solid #ff6b00}
h1{color:#ff6b00;margin-bottom:10px}
p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(255,107,0,0.1);border:2px solid #ff6b00;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff6b00}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,0,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b00,#cc5500);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🔫 UC Gratis</h1>
<p>Consigue UC para PUBG</p>
<div class="caja-oferta"><h3>🎁 EVENTO UC</h3><p style="color:#fff;">Gana <span style="color:#ff6b00;font-weight:bold;">10,000 UC</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>🎯 ID</label><input type="text" placeholder="ID de PUBG" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💎 Obtener UC</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
        p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(255,215,0,0.1);border:2px solid #ffd700;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ffd700}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,107,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b6b,#ee5a24);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🎮 Gana Robux Gratis</h1>
<p>Inicia sesión y obtén 10,000 Robux</p>
<div class="caja-oferta"><h3>🎁 SORTEO ESPECIAL</h3><p style="color:#fff;">Gana hasta <span style="color:#ffd700;font-weight:bold;">10,000 Robux</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Roblox" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">🎯 Obtener Robux</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "Free Fire")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Free Fire - Diamantes</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(135deg,#0a0a0a,#1a1a1a,#2a0a0a);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,107,53,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(255,107,53,0.2);width:400px;text-align:center;border:1px solid #ff6b35}
h1{color:#ff6b35;margin-bottom:10px}
p{color:#ffd700;margin-bottom:30px}
.caja-oferta{background:rgba(255,215,0,0.1);border:2px solid #ffd700;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ffd700}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,53,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b35,#ff4500);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🔥 Diamantes GRATIS</h1>
<p>Inicia sesión y recibe 5,000 Diamantes</p>
<div class="caja-oferta"><h3>🎁 EVENTO ESPECIAL</h3><p style="color:#fff;">Gana <span style="color:#ffd700;font-weight:bold;">5,000 Diamantes</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>🎯 ID</label><input type="text" placeholder="ID de Free Fire" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💎 Obtener Diamantes</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "TikTok")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>TikTok - Seguidores</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(135deg,#010101,#1a1a1a);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,0,80,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(255,0,80,0.2);width:400px;text-align:center;border:1px solid #ff0050}
h1{color:#ff0050;margin-bottom:10px}
p{color:#fff;margin-bottom:30px}
.caja-oferta{background:rgba(255,0,80,0.1);border:2px solid #ff0050;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff0050}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,0,80,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff0050,#cc0040);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📱 Consigue Seguidores</h1>
<p>Inicia sesión y obtén 10K seguidores</p>
<div class="caja-oferta"><h3>🎁 SORTEO DE SEGUIDORES</h3><p style="color:#fff;">Gana <span style="color:#ff0050;font-weight:bold;">10,000 Seguidores</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de TikTok" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">🚀 Obtener Seguidores</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "Facebook")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Facebook - Verificación</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#f0f2f5;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:#fff;padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.1);width:400px;text-align:center}
h1{color:#1877f2;margin-bottom:10px}
p{color:#1c1e21;margin-bottom:30px}
.caja-oferta{background:#f0f2f5;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#1877f2}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#1c1e21;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#1877f2;box-shadow:0 0 10px rgba(24,119,242,0.2)}
.btn{width:100%;padding:14px;background:#1877f2;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05);background:#166fe5}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📘 Verifica tu Cuenta</h1>
<p>Obtén el check azul de Facebook</p>
<div class="caja-oferta"><h3>✅ VERIFICACIÓN OFICIAL</h3><p>Consigue el <span style="background:#1877f2;color:#fff;padding:5px 15px;border-radius:20px;font-weight:bold;">✓ Verificado</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Facebook" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">✅ Verificar</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "Instagram")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Instagram - Verificación</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:linear-gradient(45deg,#405de6,#833ab4);min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.95);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.3);width:400px;text-align:center}
h1{color:#333;margin-bottom:10px}
p{color:#666;margin-bottom:30px}
.caja-oferta{background:linear-gradient(45deg,#405de6,#833ab4);border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#fff}
.caja-oferta p{color:#fff}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#333;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#405de6;box-shadow:0 0 10px rgba(64,93,230,0.2)}
.btn{width:100%;padding:14px;background:linear-gradient(45deg,#405de6,#833ab4);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>📸 Verifica tu Cuenta</h1>
<p>Obtén el check azul de Instagram</p>
<div class="caja-oferta"><h3>✅ VERIFICACIÓN OFICIAL</h3><p>Consigue el <span style="background:#ffd700;color:#000;padding:5px 15px;border-radius:20px;font-weight:bold;">✓ Verificado</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Instagram" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">✅ Verificar</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "WhatsApp")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>WhatsApp - Premium</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#075e54;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.3);width:400px;text-align:center}
h1{color:#fff;margin-bottom:10px}
p{color:#ddd;margin-bottom:30px}
.caja-oferta{background:rgba(37,211,102,0.2);border:2px solid #25d366;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#25d366}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(37,211,102,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:#25d366;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>💬 WhatsApp Premium</h1>
<p>Obtén funciones premium gratis</p>
<div class="caja-oferta"><h3>🎁 PREMIUM GRATIS</h3><p style="color:#fff;">Accede a <span style="color:#25d366;font-weight:bold;">WhatsApp Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>📱 Número</label><input type="text" placeholder="Número de WhatsApp" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💬 Activar Premium</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "YouTube")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>YouTube - Premium</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#fff;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:#fff;padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.1);width:400px;text-align:center}
h1{color:#ff0000;margin-bottom:10px}
p{color:#333;margin-bottom:30px}
.caja-oferta{background:#f1f1f1;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff0000}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#333;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:1px solid #ddd;border-radius:8px;font-size:16px}
.input-group input:focus{outline:none;border-color:#ff0000;box-shadow:0 0 10px rgba(255,0,0,0.2)}
.btn{width:100%;padding:14px;background:#ff0000;border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#999;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>▶️ YouTube Premium</h1>
<p>Disfruta sin anuncios</p>
<div class="caja-oferta"><h3>🎁 PREMIUM GRATIS</h3><p>Obtén <span style="color:#ff0000;font-weight:bold;">YouTube Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de YouTube" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">▶️ Activar Premium</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "Minecraft")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Minecraft - Cuenta</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Courier New',monospace;background:#2d2d2d;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.1);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.5);width:400px;text-align:center;border:2px solid #7cfc00}
h1{color:#7cfc00;margin-bottom:10px}
p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(124,252,0,0.1);border:2px solid #7cfc00;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#7cfc00}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(124,252,0,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:#7cfc00;border:none;border-radius:8px;color:#000;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>⛏️ Minecraft Premium</h1>
<p>Consigue tu cuenta premium</p>
<div class="caja-oferta"><h3>🎁 CUENTA PREMIUM</h3><p style="color:#fff;">Obtén <span style="color:#7cfc00;font-weight:bold;">Minecraft Premium</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>👤 Usuario</label><input type="text" placeholder="Usuario de Minecraft" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">⛏️ Obtener Cuenta</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
            ;;
        "PUBG Mobile")
            cat << 'EOF'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>PUBG Mobile - UC</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#1a1a1a;min-height:100vh;display:flex;justify-content:center;align-items:center}
.container{background:rgba(255,255,255,0.05);backdrop-filter:blur(10px);padding:40px;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.5);width:400px;text-align:center;border:1px solid #ff6b00}
h1{color:#ff6b00;margin-bottom:10px}
p{color:#aaa;margin-bottom:30px}
.caja-oferta{background:rgba(255,107,0,0.1);border:2px solid #ff6b00;border-radius:10px;padding:15px;margin-bottom:25px}
.caja-oferta h3{color:#ff6b00}
.input-group{margin-bottom:20px;text-align:left}
.input-group label{display:block;color:#fff;margin-bottom:5px;font-weight:bold}
.input-group input{width:100%;padding:12px;border:none;border-radius:8px;background:rgba(255,255,255,0.1);color:#fff;font-size:16px}
.input-group input:focus{outline:none;background:rgba(255,255,255,0.2);box-shadow:0 0 10px rgba(255,107,0,0.3)}
.input-group input::placeholder{color:#888}
.btn{width:100%;padding:14px;background:linear-gradient(135deg,#ff6b00,#cc5500);border:none;border-radius:8px;color:#fff;font-size:18px;font-weight:bold;cursor:pointer;transition:transform 0.3s}
.btn:hover{transform:scale(1.05)}
.footer{color:#666;margin-top:20px;font-size:12px}
</style>
</head>
<body>
<div class="container">
<h1>🔫 UC Gratis</h1>
<p>Consigue UC para PUBG</p>
<div class="caja-oferta"><h3>🎁 EVENTO UC</h3><p style="color:#fff;">Gana <span style="color:#ff6b00;font-weight:bold;">10,000 UC</span></p></div>
<form onsubmit="alert('Demo: No se guardan datos reales'); return false;">
<div class="input-group"><label>🎯 ID</label><input type="text" placeholder="ID de PUBG" required></div>
<div class="input-group"><label>🔑 Contraseña</label><input type="password" placeholder="Contraseña" required></div>
<button type="submit" class="btn">💎 Obtener UC</button>
</form>
<p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
</div>
</body>
</html>
EOF
        mkdir -p ~/mi_web

cat << HTML > ~/mi_web/index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servidor - $SELECTED_APP</title>
    <style>
        body { background-color: #ffffff; margin: 0; padding: 0; }
    </style>
</head>
<body>
</body>
</html>
HTML

pkg install python -y > /dev/null 2>&1

clear
echo -e "${CYAN}==================================================${NC}"
echo -e "${VERDE}[✔] SERVIDOR DESPLEGADO PARA: ${BLANCO}$SELECTED_APP${NC}"
echo -e "${CYAN}==================================================${NC}\n"

if [ "$net_choice" == "2" ]; then
    echo -e "${BLANCO}Enlace local:${NC}"
    echo -e "${AMARILLO}  http://localhost:8080${NC}\n"
else
    IP_LOCAL=$(ifconfig 2>/dev/null | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n 1)
    echo -e "${BLANCO}Enlace generado:${NC}"
    echo -e "${AMARILLO}  http://localhost:8080${NC}"
    if [ -n "$IP_LOCAL" ]; then
        echo -e "${AMARILLO}  http://$IP_LOCAL:8080${NC} (Para red Wi-Fi)"
    fi
fi

echo -e "\n${BLANCO}Presiona Ctrl+C para detener el servidor.${NC}\n"
cd ~/mi_web && python3 -m http.server 8080
