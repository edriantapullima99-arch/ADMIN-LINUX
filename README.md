# ADMINISTRADOR-LINUX

## Descripcion
Proyecto de automatizacion de tareas basicas de administracion Linux mediante scripts Bash.

## Objetivo
Facilitar la consulta del sistema, la gestion de archivos y la automatizacion de tareas.

## Requisitos
- Ubuntu Linux
- Bash
- AWK
- SED
- Cron

## Scripts

### 1. monitor_sistema.sh
Obtiene informacion del usuario, equipo, sistema operativo, disco y memoria RAM. Genera un reporte.

### 2. gestor_archivos.sh
Permite crear, copiar, modificar permisos y eliminar archivos segun una fecha ingresada.

### 3. automatizacion.sh
Genera analisis mediante AWK, reemplaza texto con SED y programa tareas con CRON.

### 4. limpieza_temporales.sh
Elimina archivos temporales mediante un ciclo FOR.

## Ejecucion

Desde la carpeta del proyecto:

    ./scripts/monitor_sistema.sh
    ./scripts/gestor_archivos.sh
    ./scripts/automatizacion.sh
    ./scripts/limpieza_temporales.sh

## Estructura
- scripts/: codigos Bash.
- reportes/: informes generados.
- evidencias/: capturas de ejecucion.
- archivos/: archivos de prueba.
- temporales/: archivos temporales.

## Autor
Proyecto academico - Administracion Linux.
