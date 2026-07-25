#!/data/data/com.termux/files/usr/bin/bash

# Colores ANSI
VERDE='\033[0;32m'
ROJO='\033[0;31m'
ROJO_PARPADEO='\033[5;31m'
VERDE_BRILLANTE='\033[1;32m'
NC='\033[0m' # Sin color

clear
echo -e "${VERDE_BRILLANTE}"
echo "=================================================="
echo "    [ SYSTEM OVERRIDE // INITIATING PROTOCOL ]    "
echo "=================================================="
echo -e "${NC}"
sleep 1

# Simulación de visuales "hacker"
echo -e "${VERDE}[+] Conectando a nodos remotos...${NC}"
sleep 1
echo -e "${VERDE}[+] Saltando proxies: 192.168.1.1 -> 10.0.0.254 -> 172.16.0.1${NC}"
sleep 1
echo -e "${VERDE}[+] Inyectando secuencia en memoria temporal...${NC}"
sleep 1

# Barra de carga falsa
echo -n -e "${VERDE}[+] Bypass de seguridad local: [${NC}"
for i in {1..20}; do
    echo -n -e "${VERDE_BRILLANTE}#${NC}"
    sleep 0.1
done
echo -e "${VERDE_BRILLANTE}] 100% COMPLETADO${NC}"
sleep 1

echo -e "${ROJO_PARPADEO}[!] ACCESO CONCEDIDO AL SISTEMA [!]${NC}\n"
sleep 1

echo -e "${VERDE}[+] Ejecutando instalador real...${NC}"
echo "--------------------------------------------------"

# --- AQUÍ EMPIEZA LA INSTALACIÓN REAL ---

pkg update -y && pkg install termux-services -y

cat << 'SCRIPT' > ~/mi_script.sh
#!/data/data/com.termux/files/usr/bin/bash
while true; do
    echo "[$(date '%Y-%m-%d %H:%M:%S')] Servicio corriendo" >> ~/servicio.log
    sleep 5
done
SCRIPT
chmod +x ~/mi_script.sh

mkdir -p $PREFIX/var/service/mi_servicio
cat << 'SERVICE' > $PREFIX/var/service/mi_servicio/run
#!/usr/bin/sh
exec 2>&1
exec /data/data/com.termux/files/home/mi_script.sh
SERVICE
chmod +x $PREFIX/var/service/mi_servicio/run

cat << 'CMD' > $PREFIX/bin/mi-herramienta
#!/data/data/com.termux/files/usr/bin/bash
case "$1" in
    start)
        sv-enable mi_servicio
        echo "Servicio iniciado."
        ;;
    stop)
        sv-disable mi_servicio
        echo "Servicio detenido."
        ;;
    status)
        sv status mi_servicio
        ;;
    log)
        tail -f ~/servicio.log
        ;;
    *)
        echo "Uso: mi-herramienta {start|stop|status|log}"
        ;;
esac
CMD
chmod +x $PREFIX/bin/mi-herramienta

echo -e "\n${VERDE_BRILLANTE}[✔] Instalación completada con éxito.${NC}"
