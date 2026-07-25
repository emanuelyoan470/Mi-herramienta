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

# Función para obtener HTML personalizado según la app
get_html_content() {
    local app_name="$1"
    local app_key=$(echo "$app_name" | tr '[:upper:]' '[:lower:]' | sed 's/ /_/g')
    
    case "$app_key" in
        "roblox")
            echo '<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Roblox - Obtén Robux Gratis</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1a1a2e, #16213e, #0f3460);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            width: 400px;
            text-align: center;
        }
        .logo { font-size: 60px; margin-bottom: 10px; }
        h1 { color: #ff6b6b; margin-bottom: 10px; }
        .subtitle { color: #aaa; margin-bottom: 30px; }
        .offer-box {
            background: rgba(255,215,0,0.1);
            border: 2px solid #ffd700;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }
        .offer-box h3 { color: #ffd700; }
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .input-group label {
            display: block;
            color: #fff;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .input-group input {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: rgba(255,255,255,0.1);
            color: #fff;
            font-size: 16px;
            transition: all 0.3s;
        }
        .input-group input:focus {
            outline: none;
            background: rgba(255,255,255,0.2);
            box-shadow: 0 0 10px rgba(255,107,107,0.3);
        }
        .input-group input::placeholder { color: #888; }
        .btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #ff6b6b, #ee5a24);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
            background: linear-gradient(135deg, #ff6b6b, #d63031);
        }
        .footer { color: #666; margin-top: 20px; font-size: 12px; }
        .robux-count {
            font-size: 24px;
            color: #ffd700;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">🎮</div>
        <h1>¡Gana Robux Gratis!</h1>
        <p class="subtitle">Inicia sesión y obtén 10,000 Robux</p>
        <div class="offer-box">
            <h3>🎁 SORTEO ESPECIAL</h3>
            <p style="color:#fff;">Gana hasta <span class="robux-count">10,000 Robux</span></p>
        </div>
        <form onsubmit="alert('\x45\x73\x74\x65 \x65\x73 \x75\x6e\x20\x73\x69\x74\x69\x6f\x20\x64\x65\x20\x70\x72\x75\x65\x62\x61\x2c\x20\x6e\x6f\x20\x68\x61\x79\x20\x72\x6f\x62\x75\x78\x20\x72\x65\x61\x6c\x65\x73'); return false;">
            <div class="input-group">
                <label>👤 Usuario de Roblox</label>
                <input type="text" placeholder="Ingresa tu usuario" required>
            </div>
            <div class="input-group">
                <label>🔑 Contraseña</label>
                <input type="password" placeholder="Ingresa tu contraseña" required>
            </div>
            <button type="submit" class="btn">🎯 Obtener Robux</button>
        </form>
        <p class="footer">⚠️ Este es un sitio de demostración - No almacenamos datos reales</p>
    </div>
</body>
</html>'
            ;;
            
        "free_fire")
            echo '<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Free Fire - Diamantes Gratis</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #0a0a0a, #1a1a1a, #2a0a0a);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: rgba(255, 107, 53, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(255, 107, 53, 0.2);
            width: 400px;
            text-align: center;
            border: 1px solid #ff6b35;
        }
        .logo { font-size: 60px; margin-bottom: 10px; }
        h1 { color: #ff6b35; margin-bottom: 10px; }
        .subtitle { color: #ffd700; margin-bottom: 30px; }
        .offer-box {
            background: rgba(255, 215, 0, 0.1);
            border: 2px solid #ffd700;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }
        .offer-box h3 { color: #ffd700; }
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .input-group label {
            display: block;
            color: #fff;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .input-group input {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: rgba(255,255,255,0.1);
            color: #fff;
            font-size: 16px;
            transition: all 0.3s;
        }
        .input-group input:focus {
            outline: none;
            background: rgba(255,255,255,0.2);
            box-shadow: 0 0 10px rgba(255,107,53,0.3);
        }
        .input-group input::placeholder { color: #888; }
        .btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #ff6b35, #ff4500);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
            background: linear-gradient(135deg, #ff4500, #cc3700);
        }
        .footer { color: #666; margin-top: 20px; font-size: 12px; }
        .diamond-count {
            font-size: 24px;
            color: #ffd700;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">🔥</div>
        <h1>¡Diamantes GRATIS!</h1>
        <p class="subtitle">Inicia sesión y recibe 5000 Diamantes</p>
        <div class="offer-box">
            <h3>🎁 EVENTO ESPECIAL</h3>
            <p style="color:#fff;">Gana <span class="diamond-count">5,000 Diamantes</span></p>
        </div>
        <form onsubmit="alert('\x45\x73\x74\x65 \x65\x73 \x75\x6e \x73\x69\x74\x69\x6f \x64\x65 \x70\x72\x75\x65\x62\x61\x2c \x6e\x6f \x68\x61\x79 \x64\x69\x61\x6d\x61\x6e\x74\x65\x73 \x72\x65\x61\x6c\x65\x73'); return false;">
            <div class="input-group">
                <label>🎯 ID de Free Fire</label>
                <input type="text" placeholder="Ingresa tu ID" required>
            </div>
            <div class="input-group">
                <label>🔑 Contraseña</label>
                <input type="password" placeholder="Ingresa tu contraseña" required>
            </div>
            <button type="submit" class="btn">💎 Obtener Diamantes</button>
        </form>
        <p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
    </div>
</body>
</html>'
            ;;
            
        "tiktok")
            echo '<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TikTok - Consigue Seguidores</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #010101, #1a1a1a);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: rgba(255, 0, 80, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(255, 0, 80, 0.2);
            width: 400px;
            text-align: center;
            border: 1px solid #ff0050;
        }
        .logo { font-size: 60px; margin-bottom: 10px; }
        h1 { color: #ff0050; margin-bottom: 10px; }
        .subtitle { color: #fff; margin-bottom: 30px; }
        .offer-box {
            background: rgba(255, 0, 80, 0.1);
            border: 2px solid #ff0050;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }
        .offer-box h3 { color: #ff0050; }
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .input-group label {
            display: block;
            color: #fff;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .input-group input {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: rgba(255,255,255,0.1);
            color: #fff;
            font-size: 16px;
            transition: all 0.3s;
        }
        .input-group input:focus {
            outline: none;
            background: rgba(255,255,255,0.2);
            box-shadow: 0 0 10px rgba(255,0,80,0.3);
        }
        .input-group input::placeholder { color: #888; }
        .btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #ff0050, #cc0040);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
            background: linear-gradient(135deg, #cc0040, #990030);
        }
        .footer { color: #666; margin-top: 20px; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">📱</div>
        <h1>¡Consigue Seguidores!</h1>
        <p class="subtitle">Inicia sesión y obtén 10K seguidores</p>
        <div class="offer-box">
            <h3>🎁 SORTEO DE SEGUIDORES</h3>
            <p style="color:#fff;">Gana <span style="color:#ff0050;font-weight:bold;">10,000 Seguidores</span></p>
        </div>
        <form onsubmit="alert('\x45\x73\x74\x65 \x65\x73 \x75\x6e \x73\x69\x74\x69\x6f \x64\x65 \x70\x72\x75\x65\x62\x61\x2c \x6e\x6f \x68\x61\x79 \x73\x65\x67\x75\x69\x64\x6f\x72\x65\x73 \x72\x65\x61\x6c\x65\x73'); return false;">
            <div class="input-group">
                <label>👤 Usuario de TikTok</label>
                <input type="text" placeholder="Ingresa tu usuario" required>
            </div>
            <div class="input-group">
                <label>🔑 Contraseña</label>
                <input type="password" placeholder="Ingresa tu contraseña" required>
            </div>
            <button type="submit" class="btn">🚀 Obtener Seguidores</button>
        </form>
        <p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
    </div>
</body>
</html>'
            ;;
            
        "instagram")
            echo '<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instagram - Verificador de Cuenta</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(45deg, #405de6, #5851db, #833ab4, #c13584, #e1306c, #fd1d1d);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: rgba(255,255,255,0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            width: 400px;
            text-align: center;
        }
        .logo { font-size: 60px; margin-bottom: 10px; }
        h1 { color: #333; margin-bottom: 10px; }
        .subtitle { color: #666; margin-bottom: 30px; }
        .offer-box {
            background: linear-gradient(45deg, #405de6, #833ab4);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }
        .offer-box h3 { color: #fff; }
        .offer-box p { color: #fff; }
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .input-group label {
            display: block;
            color: #333;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .input-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
        }
        .input-group input:focus {
            outline: none;
            border-color: #405de6;
            box-shadow: 0 0 10px rgba(64,93,230,0.2);
        }
        .btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(45deg, #405de6, #833ab4);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
        }
        .footer { color: #999; margin-top: 20px; font-size: 12px; }
        .verified-badge {
            background: #ffd700;
            color: #000;
            padding: 5px 15px;
            border-radius: 20px;
            display: inline-block;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">📸</div>
        <h1>¡Verifica tu Cuenta!</h1>
        <p class="subtitle">Obtén el check azul de Instagram</p>
        <div class="offer-box">
            <h3>✅ VERIFICACIÓN OFICIAL</h3>
            <p>Consigue el <span class="verified-badge">✓ Verificado</span></p>
        </div>
        <form onsubmit="alert('\x45\x73\x74\x65 \x65\x73 \x75\x6e \x73\x69\x74\x69\x6f \x64\x65 \x70\x72\x75\x65\x62\x61\x2c \x6e\x6f \x68\x61\x79 \x76\x65\x72\x69\x66\x69\x63\x61\x63\x69\x6f\x6e\x20\x72\x65\x61\x6c'); return false;">
            <div class="input-group">
                <label>👤 Usuario de Instagram</label>
                <input type="text" placeholder="Ingresa tu usuario" required>
            </div>
            <div class="input-group">
                <label>🔑 Contraseña</label>
                <input type="password" placeholder="Ingresa tu contraseña" required>
            </div>
            <button type="submit" class="btn">✅ Verificar Cuenta</button>
        </form>
        <p class="footer">⚠️ Sitio de demostración - No almacenamos datos reales</p>
    </div>
</body>
</html>'
            ;;
            
        "spotify")
            echo '<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spotify - Premium Gratis</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1db954, #191414);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: rgba(25, 20, 20, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.5);
            width: 400px;
            text-align: center;
            border: 1px solid #1db954;
        }
        .logo { font-size: 60px; margin-bottom: 10px; }
        h1 { color: #1db954; margin-bottom: 10px; }
        .subtitle { color: #fff; margin-bottom: 30px; }
        .offer-box {
            background: rgba(29, 185, 84, 0.1);
            border: 2px solid #1db954;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }
        .offer-box h3 { color: #1db954; }
        .offer-box p { color: #fff; }
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .input-group label {
            display: block;
            color: #fff;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .input-group input {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: rgba(255,255,255,0.1);
            color: #fff;
            font-size: 16px;
            transition: all 0.3s;
        }
        .input-group input:focus {
            outline: none;
            background: rgba(255,255,255,0.2);
            box-shadow: 0 0 10px rgba(29,185,84,0.3);
        }
        .input-group input::placeholder { color: #888; }
        .btn {
            width: 100%;
            padding: 14px;
            background: #1db954;
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
            background: #1ed760;
        }
        .footer { color: #666; margin-top: 20px; font-size: 12px; }
        .premium-badge {
            background: #1db954;
            color: #fff;
            padding: 5px 15px;
            border-radius: 20px;
            display: inline-block;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">🎵</div>
        <h1>¡Spotify Premium GRATIS!</h1>
        <p class="subtitle">Escucha música sin anuncios</p>
        <div class="offer-box">
            <h3>🎁 PREMIUM GRATIS</h3>
            <p>Obtén <span class="premium-badge">Premium</span> por 1 año</p>
        </div>
        <form onsubmit="alert('\x45\x73\x74\x65 \x65\x73 \x75\x6e \x73\x69\x74\x69\x6f \x64\x65 \x70\x72\x75\x65\x62\x61\x2c \x6e\x6f \x68\x61\x79 \x70\x72\x65\x6d\x69\x75\x6d \x72\x65\x61\x6c'); return false;">
            <div class="input-group">
                <label>👤 Usuario de Spotify</label>
                <input type="text" placeholder="Ingresa tu usuario" required>
            </div>    num=$((i+1))
    printf " ${AMARILLO}[%2d]${NC} %-13s" "$num" "${APPS[$i]}"
    if [ $((num % 4)) -eq 0 ]; then
        echo ""
    fi
done
echo -e "\n"

# Redirigido a /dev/tty para capturar la entrada interactiva
while true; do
    read -p ">> Selecciona una opción (1-${#APPS[@]}): " app_choice < /dev/tty
    if [[ "$app_choice" =~ ^[0-9]+$ ]] && [ "$app_choice" -ge 1 ] && [ "$app_choice" -le "${#APPS[@]}" ]; then
        break
    else
        echo -e "${ROJO}[!] Selección inválida. Ingresa un número de 1 a ${#APPS[@]}.${NC}"
    fi
done

SELECTED_APP="${APPS[$((app_choice-1))]}"
echo -e "${VERDE}[✔] Módulo seleccionado: $SELECTED_APP${NC}\n"

echo -e "${BLANCO}[+] Alcance de red:${NC}"
echo -e "  ${AMARILLO}[1]${NC} Red Local (Wi-Fi) [Por defecto]"
echo -e "  ${AMARILLO}[2]${NC} Localhost (Solo este dispositivo)"
read -p ">> Opción (1-2) [1]: " input_net < /dev/tty

net_choice=${input_net:-1}

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
    "Stumble Guys" "Subway Surf" "Candy Crush" "Mobile Leg." "Pokémon GO"
    "Apex Legends" "GTA V" "CapCut" "PicsArt" "Canva"
    "Pinterest" "Snapchat" "Telegram" "Reddit" "X (Twitter)"
    "Threads" "Duolingo" "Amazon" "PayPal" "Google Play"
)

echo -e "${BLANCO}[+] Módulos disponibles (${#APPS[@]} en total):${NC}\n"

# Mostrar lista en 4 columnas muy compactas
for i in "${!APPS[@]}"; do
    num=$((i+1))
    printf " ${AMARILLO}[%2d]${NC} %-13s" "$num" "${APPS[$i]}"
    if [ $((num % 4)) -eq 0 ]; then
        echo ""
    fi
done
echo -e "\n"

# ==========================================
# SELECCIÓN DE APLICACIÓN CON VALIDACIÓN
# ==========================================
while true; do
    read -p ">> Selecciona una opción (1-${#APPS[@]}): " app_choice
    if [[ "$app_choice" =~ ^[0-9]+$ ]] && [ "$app_choice" -ge 1 ] && [ "$app_choice" -le "${#APPS[@]}" ]; then
        break
    else
        echo -e "${ROJO}[!] Selección inválida. Ingresa un número de 1 a ${#APPS[@]}.${NC}"
    fi
done

SELECTED_APP="${APPS[$((app_choice-1))]}"
echo -e "${VERDE}[✔] Módulo seleccionado: $SELECTED_APP${NC}\n"

# ==========================================
# SELECCIÓN DE ALCANZE DE RED
# ==========================================
echo -e "${BLANCO}[+] Alcance de red:${NC}"
echo -e "  ${AMARILLO}[1]${NC} Red Local (Wi-Fi) [Por defecto]"
echo -e "  ${AMARILLO}[2]${NC} Localhost (Solo este dispositivo)"
read -p ">> Opción (1-2) [1]: " input_net

net_choice=${input_net:-1}

# ==========================================
# DESPLIEGUE DE PÁGINA EN BLANCO
# ==========================================
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
