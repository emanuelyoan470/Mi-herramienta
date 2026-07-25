#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Instalando dependencias..."
pkg update -y && pkg install termux-services -y

echo "[+] Creando script principal..."
cat << 'SCRIPT' > ~/mi_script.sh
#!/data/data/com.termux/files/usr/bin/bash
while true; do
    echo "[$(date '%Y-%m-%d %H:%M:%S')] Servicio corriendo" >> ~/servicio.log
    sleep 5
done
SCRIPT
chmod +x ~/mi_script.sh

echo "[+] Configurando estructura de servicio..."
mkdir -p $PREFIX/var/service/mi_servicio
cat << 'SERVICE' > $PREFIX/var/service/mi_servicio/run
#!/usr/bin/sh
exec 2>&1
exec /data/data/com.termux/files/home/mi_script.sh
SERVICE
chmod +x $PREFIX/var/service/mi_servicio/run

echo "[+] Creando comando ejecutable..."
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

echo "[✔] Instalación completada. Ejecuta 'mi-herramienta start' para iniciar."
