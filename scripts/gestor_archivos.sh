#!/bin/bash

# Gestor de archivos - ADMINISTRADOR-LINUX

RUTA="$HOME/ADMINISTRADOR-LINUX/archivos"
mkdir -p "$RUTA"

crear_archivo() {
    read -p "Nombre del archivo: " nombre
    if [[ -z "$nombre" || "$nombre" == */* ]]; then
        echo "Nombre no valido."
    elif [[ -e "$RUTA/$nombre" ]]; then
        echo "El archivo ya existe."
    else
        touch "$RUTA/$nombre"
        echo "Archivo creado."
    fi
}

copiar_archivo() {
    read -p "Archivo a copiar: " nombre
    if [[ -f "$RUTA/$nombre" ]]; then
        cp "$RUTA/$nombre" "$RUTA/copia_$nombre"
        echo "Copia realizada."
    else
        echo "Archivo no encontrado."
    fi
}

cambiar_permisos() {
    read -p "Nombre del archivo: " nombre
    if [[ -f "$RUTA/$nombre" ]]; then
        chmod 644 "$RUTA/$nombre"
        echo "Permisos cambiados a 644."
    else
        echo "Archivo no encontrado."
    fi
}

eliminar_por_fecha() {
    read -p "Fecha limite (AAAA-MM-DD): " fecha
    if [[ ! "$fecha" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] || ! date -d "$fecha" >/dev/null 2>&1; then
        echo "Fecha no valida."
        return
    fi
    read -p "Eliminar archivos anteriores a esa fecha? (s/n): " confirmar
    if [[ "$confirmar" == "s" ]]; then
        find "$RUTA" -maxdepth 1 -type f ! -newermt "$fecha" -print -delete
        echo "Limpieza finalizada."
    else
        echo "Operacion cancelada."
    fi
}

while true; do
    echo ""
    echo "===== GESTOR DE ARCHIVOS ====="
    echo "1. Crear archivo"
    echo "2. Copiar archivo"
    echo "3. Cambiar permisos"
    echo "4. Eliminar por fecha"
    echo "5. Listar archivos"
    echo "6. Salir"
    read -p "Seleccione una opcion: " opcion

    case "$opcion" in
        1) crear_archivo ;;
        2) copiar_archivo ;;
        3) cambiar_permisos ;;
        4) eliminar_por_fecha ;;
        5) ls -lah "$RUTA" ;;
        6) echo "Saliendo."; break ;;
        *) echo "Opcion no valida." ;;
    esac
done
