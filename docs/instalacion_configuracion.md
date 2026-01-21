## GUIA DE INSTALACIÓN · CONFIGURACIÓN - Tienda online

## 1. Prerrequisitos

- Flutter SDK instalado y configurado.
- Android Studio o movil Android físico.
- Google Chrome si se ejecuta en web.
- Conexión a internet.
- Cuenta Firebase

## 2. Descarga del proyecto
Puedes obtener el proyecto de dos formas:

    - Opción A -> Clonar repositorio
        git clone https://github.com/Gerardlf/tiendaOnline.git
    - Opción B -> Descargar ZIP
        1. Descargar el ZIP.
        2. Descomprimirlo en una carpeta local.        


## 3. Instalación de dependencias
Dependencias principales usadas en el pubspec.yaml:
- http (API REST)
- provider (estado)
- go_router (navegación)
- firebase_core
- firebse_auth
- cloud_firestore
- fl_chart

Descargar dependencias con:
- flutter pub get


## 4. Ejecución del proyecto
Para ejecutar el proyecto debemos usar el comando
- flutter run

## 5. Configuración Firebase

Este repositorio es público por lo que no se incluyen archivos sensibles de Firebase como:
- lib/firebase_options.dart
- android/app/google-services.json
- ios/Runner/googleService-Info.plist

Para poder usar Firebase, debes generar los archivos en tu equipo.

·En Firebase debes crear un proyecto en la console de Firebase y activar:
- Autentication -> Anonymous
- Firestore Database
Instalar CLI
- dart pub global activate flutterfire_cli
- flutterfire configure
Esto crea automaticamente:
- lib/firebase_options.dart y la configuración de las plataformas seleccionadas.

## 6. Configuración API REST

La app consume datos de productos desde la API pública FakeStoreAPI:
https://fakestoreapi.com/products

El endpoint es gestionado desde el archivo:
- lib/api/api_client.dart

## Problemas frecuentes

**Código en rojo tras flutter clean**
- ejecutar flutter pub get

**Error al cargar productos**
- Revisar conexión a internet

**insuficientes permisos (Firestore)**
- Permitir lectura/escritura al usuario autenticado con reglas de seguridad en Firestore.


## keystore de pruebas FIRMA DIGITAL SIMULADA

La aplicaión utiliza un keystore de pruebas

- Firma digital simulada
Para generar el APK en modo districión (release) se utiliza firma simulada mediante un keystore de pruebas.
-Crear keystore (local) generado en el ordenador del desarrollador
keytool -genkey -v -keystore ud7-keystore.jks -alias ud7 -keyalg RSA -keysize 2048 -validity 10000
- IMPORTANTE NO SUBIR -

Se crea en: android/key.properties

(archivo local incluido en .gitignore para no subirlo)

 - Generamos APK final con: flutter build apk --release

 y obtendremos el APK en la carpeta

 build/app/outputs/flutter-apk/app-release.apk

este archivo ha sido copiado en la carpeta releases.

##                        CANALES DE DISTRIBUCIÓN


##                        Distribución Android

**Android**

La app puede distribuirse por:

APK de pruebas: compartiendo el archivo app-release.apk (por ejemplo por Google Drive, correo, enlace directo, etc.).

Google Play (producción): publicando un AAB en Google Play Console.

-Instalación: 
    Para instalar el APK en un dispositivo Android debemos: 

    1) Copiar el APK al dispositivo (por ejemplo mediante USB)
    2) Abre el APK desde un gestor de archivos (ejemplo desde  descargas)
    3) Si el dispositivo lo solicita, activa **Permitir instalar apps desconocidas**
    4) pulsa Instalar


Desinstalación:
    Para desinstalar la app:

    1) Ajustes -> Aplicaciones.
    2) Busca el nombre de la app.
    3) Pulsa Desintalar.



##                        Distribución web (build estático)

La aplicación también se puede ejecutar como versión web mediante un buid estático.

**WEB**

La app puede distribuirse como web estática mediante:

Hosting estático: GitHub Pages, Netlify o Vercel.

El contenido a desplegar sería el generado en build/web/ o el ZIP releases/build_web.zip.


- Generar el build web:

Desde la raiz del proyecto
    - flutter build web
    esto generará los archivos build/web
    - con el comando: Compress-Archive -Path build\web\* -DestinationPath releases\build_web.zip -Force creamos el ZIP en la carpera releases.

- Ejecutar el build Web en local:

    - Descomprime el fichero: releases/build_web.zip
    - Entra en la carpeta y levanta un servidor local: python -m http.server 8080
    - Abre el navegador http://localhost:8080

- Desinstalación Web

    - Borrar carpeta comprimida.

>NOTA: Para la versión Web se recomienda el uso de Google Chrome.

**Android**

La app puede distribuirse por:

APK de pruebas: compartiendo el archivo app-release.apk (por ejemplo por Google Drive, correo, enlace directo, etc.).

Google Play (producción): publicando un AAB en Google Play Console (solo a nivel descriptivo, no obligatorio en esta práctica).





