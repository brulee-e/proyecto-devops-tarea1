# Reserva de Horas Médicas – Proyecto DevOps

Servicio web estático para reservar horas médicas en una empresa del rubro salud (Centro Médico Cordillera, ficticio). Es una página HTML + CSS servida con **Nginx** dentro de un contenedor **Docker** y levantada con **Docker Compose** en el puerto **8080**.

> Proyecto académico (DevOps, IACC 2026)

## Estructura

```
proyecto-devops/
├── src/
│   ├── index.html          # Formulario de reserva, datos de atención y estado del servicio
│   └── styles.css          # Estilos del sitio
├── Dockerfile              # Imagen basada en nginx:alpine
├── docker-compose.yml      # Levanta el servicio en el puerto 8080
├── .env.example            # Variables de ejemplo, sin valores sensibles
├── .gitignore              # Archivos que no se versionan (.env, logs, etc.)
├── README.md
└── .github/workflows/
    └── devops-automation.yml   # (Opcional) validación automática con GitHub Actions
```

## Requisitos

- Git
- Docker Desktop instalado y con el motor iniciado (*Engine running*)
- Navegador web

## Instalación

```bash
git clone https://github.com/<tu-usuario>/<nombre-repo>.git
cd <nombre-repo>
```

Opcional: crear el archivo `.env` a partir del ejemplo (si no existe, se usa el puerto 8080 por defecto).

```bash
# Windows (PowerShell)
copy .env.example .env
# Linux / macOS
cp .env.example .env
```

## Ejecución

```bash
docker compose up -d --build
```

## Verificación

1. Abrir en el navegador: **http://localhost:8080**
2. Revisar el estado del contenedor:

```bash
docker compose ps
docker ps
```

3. Revisar logs y uso de recursos:

```bash
docker logs reserva-horas-web
docker stats --no-stream
```

## Detener el servicio

```bash
docker compose down
```

## Seguridad

- El archivo `.env` está en `.gitignore`, así que no se sube al repositorio.
- `.env.example` solo trae valores de ejemplo, sin credenciales reales.
- El sitio usa datos ficticios y el formulario no envía información a ningún servidor.
- No se publican tokens, claves ni datos personales en el código ni en los commits.

## Automatización (opcional)

Con cada `push` o `pull request` hacia `main`, el workflow `devops-automation.yml` revisa que estén los archivos obligatorios y que no se haya subido un `.env`. Además construye la imagen, levanta el contenedor, prueba que responda en el puerto 8080 y al final lo detiene. Los resultados se ven en la pestaña **Actions** del repositorio.
