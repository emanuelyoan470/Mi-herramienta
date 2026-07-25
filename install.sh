#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# COLORES ANSI
# ==========================================
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
CYAN='\033[0;36m'
BLANCO='\033[1;37m'
NC='\033[0m'

clear

# ==========================================
# BANNER PRINCIPAL
# ==========================================
echo -e "${CYAN}"
echo "   ██████╗ ███████╗██████╗ ██╗   ██╗███████╗██████╗ "
echo "   ██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗"
echo "   ██████╔╝█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝"
echo "   ██╔══██╗██╔══╝  ██╔══██╗██║   ██║██╔══╝  ██╔══██╗"
echo "   ██████╔╝███████╗██║  ██║╚██████╔╝███████╗██║  ██║"
echo "   ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo -e "${AMARILLO}        [ WEB SERVER DEPLOYMENT TOOL v1.0 ]${NC}\n"

# ==========================================
# SELECCIÓN DE SERVICIO
# ==========================================
echo -e "${BLANCO}[+] Selecciona la aplicación/módulo a configurar:${NC}"
echo -e "  ${AMARILLO}[1]${NC} Módulo Alpha"
echo -e "  ${AMARILLO}[2]${NC} Módulo Beta"
echo -e "  ${AMARILLO}[3]${NC} Módulo Gamma"
echo -e "  ${AMARILLO}[4]${NC} Módulo Delta"
read -p ">> Selecciona una opción (1-4): " opt_app

# ==========================================
# SELECCIÓN DE MODO DE RED
# ==========================================
echo -e "\n${BLANCO}[+] Selecciona el tipo de alcance de red:${NC}"
echo -e "  ${AMARILLO}[1]${NC} Red Local (Solo dispositivos en tu Wi-Fi)"
echo -e "  ${AMARILLO}[2]${NC} Red Externa (Túnel global)"
read -p ">> Selecciona el modo (1-2): " opt_net

# ==========================================
# DESPLIEGUE DEL SERVIDOR WEB
# ==========================================
echo -e "\n${VERDE}[+] Preparando archivos del sitio web...${NC}"
mkdir -p ~/mi_web

# Crear una página HTML en blanco con un mensaje genérico
cat << 'HTML' > ~/mi_web/index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servidor Activo</title>
    <style>
        body { font-family: sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #ffffff; }
        .box { text-align: center; color: #333; }
    </style>
</head>
<body>
    <div class="box">
        <h1>Servidor Web en Blanco</h1>
        <p>El servicio ha sido desplegado correctamente.</p>
    </div>
</body>
</html>
HTML

echo -e "${VERDE}[+] Verificando Python...${NC}"
pkg install python -y > /dev/null 2>&1

clear
echo -e "${CYAN}==================================================${NC}"
echo -e "${VERDE}[✔] SERVIDOR DESPLEGADO CON ÉXITO${NC}"
echo -e "${CYAN}==================================================${NC}\n"

if [ "$opt_net" == "1" ]; then
    # Obtener IP local en Termux
    IP_LOCAL=$(ifconfig 2>/dev/null | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n 1)
    
    echo -e "${BLANCO}Tu sitio web está corriendo localmente en:${NC}"
    echo -e "${AMARILLO}  http://localhost:8080${NC}"
    if [ -n "$IP_LOCAL" ]; then
        echo -e "${AMARILLO}  http://$IP_LOCAL:8080${NC} (Para dispositivos en tu red Wi-Fi)"
    fi
    echo -e "\n${BLANCO}Presiona Ctrl+C para detener el servidor.${NC}\n"
    cd ~/mi_web && python3 -m http.server 8080

elif [ "$opt_net" == "2" ]; then
    echo -e "${BLANCO}Para la opción externa localmente, el servidor se iniciará en puerto 8080.${NC}"
    echo -e "${AMARILLO}http://localhost:8080${NC}\n"
    echo -e "${BLANCO}Presiona Ctrl+C para detener el servidor.${NC}\n"
    cd ~/mi_web && python3 -m http.server 8080
else
    echo -e "${ROJO}[!] Opción de red no válida.${NC}"
fi
