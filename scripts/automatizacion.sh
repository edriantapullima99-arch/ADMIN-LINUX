#!/bin/bash

# Proyecto: ADMINISTRADOR-LINUX
# Script: Automatizacion

BASE="$HOME/ADMINISTRADOR-LINUX"
REPORTES="$BASE/reportes"
ARCHIVO="$REPORTES/registro.txt"
REPORTE="$REPORTES/analisis.txt"

mkdir -p "$REPORTES"

if [[ ! -f "$ARCHIVO" ]]; then
    cat > "$ARCHIVO" <<DATOS
servidor,estado,uso
Ubuntu-Server,activo,57
Servidor-Prueba,inactivo,80
Equipo-Linux,activo,35
DATOS
fi

generar_analisis() {
    echo "===== ANALISIS DE REGISTROS =====" > "$REPORTE"
    awk -F',' 'NR>1 {print "Equipo: "$1" | Estado: "$2" | Uso: "$3"%"}' "$ARCHIVO" >> "$REPORTE"
    echo "Analisis generado correctamente."
}

reemplazar_texto() {
    sed -i 's/inactivo/detenido/g' "$ARCHIVO"
    echo "Texto reemplazado correctamente."
}

programar_tarea() {
    (crontab -l 2>/dev/null | grep -v 'automatizacion.sh'; echo "*/5 * * * * /bin/bash $BASE/scripts/automatizacion.sh generar") | crontab -
    echo "Tarea programada cada 5 minutos."
}

case "$1" in
    generar)
        generar_analisis
        ;;
    reemplazar)
        reemplazar_texto
        ;;
    programar)
        programar_tarea
        ;;
    *)
        echo "===== AUTOMATIZACION ====="
        echo "1. Generar analisis con AWK"
        echo "2. Reemplazar texto con SED"
        echo "3. Programar tarea con CRON"
        echo "4. Salir"
        read -p "Seleccione una opcion: " opcion
        case "$opcion" in
            1) generar_analisis ;;
            2) reemplazar_texto ;;
            3) programar_tarea ;;
            4) echo "Saliendo." ;;
            *) echo "Opcion no valida." ;;
        esac
        ;;
esac
