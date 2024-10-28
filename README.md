# Traductor LSG
Diseño, Desarrollo E Implementación De  Un Sistema Traductor De Lengua  De Señas Guatemalteco En Tiempo Real  Por Medio De Inteligencia Artificial  Para Personas Con Discapacidad Auditiva

Video del Funcionamiento:
https://youtu.be/TfViGbjn-Dc

## Índice

- [Instalación de la App Android](#instalación-de-la-app-android)
- [Instrucciones para el Modelo AI](#instrucciones-para-el-modelo-ai)
- [Ejecución del Frontend en Flutter](#ejecución-del-frontend-en-flutter)
- [Ejecución del Backend](#ejecución-del-backend)
  
## Funcionalidades principales

- **Reconocimiento de señas en tiempo real**: Traducción automática de señas capturadas por la cámara a texto.
- **Interfaz de usuario**: Pantalla interactiva que muestra las traducciones en tiempo real.
- **Acceso de usuario**: Al iniciar puede requerir un usuario "admin" con la contraseña "admin" para acceder a toda la funcionalidad.

## Instalación de la App Android

### Prerrequisitos

- **Android Studio** o un dispositivo **Android** con habilitación de instalación de apps externas.
- **APK**: El archivo de la app se proporciona como un APK para instalación directa.

### Pasos para instalar la aplicación

1. **Descargar el APK**: 
   - Descargar el archivo APK directamente desde [aquí](app-release.apk) (Descargar app-release.apk) o compilar la app desde el código fuente utilizando Android Studio con Flutter.

2. **Habilitar instalación desde fuentes desconocidas (En caso no este habilitado aún)**:
   - Ir a **Configuración** -> **Seguridad** -> **Instalar aplicaciones desconocidas** (puede variar según la versión de Android).
   - Habilitar la opción para permitir la instalación desde tu navegador o la carpeta donde se ha descargado el APK.

3. **Instalar el APK**:
   - Abrir el archivo APK descargado en el dispositivo.
   - Tocar el botón de instalación y seguir las instrucciones en pantalla.

4. **Acceso de usuario**:
   - Al iniciar la app puede que pida para ingresar un usuario y contraseña.
   - Use las siguientes credenciales para acceder a todas las funcionalidades:
     - **Usuario**: `admin@admin.com`
     - **Contraseña**: `admin`
   
  - Credenciales de un usuario normal:
    - **Usuario**: `jeison@gmail.com`
    - **Contraseña**: `123` 

5. **Uso de la app**:
   - Una vez que haya iniciado sesión, podrá comenzar a usar la funcionalidad de traducción de lengua de señas en tiempo real colocando señas frente a la cámara, se podrá observar su traducción en tiempo real y con voz. Se pueden encontrar más instrucciones al tocar los botones dentro de la App.

## Requisitos adicionales

- La aplicación requiere un dispositivo con **cámara** para detectar las señas e **internet**.
- Asegúrate de que la aplicación tenga permisos para acceder a la cámara de tu dispositivo.

## Algunas capturas
<img src="https://github.com/user-attachments/assets/d8dc2da9-00e3-4e7e-8116-4d4d62bf1bc4" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/0704f5a2-808e-4b56-9284-338a15faf795" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/7c220dfb-6ace-45f5-9f90-ffacb8389700" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/47b35301-1822-4a08-b79e-752cb3890ad2" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/b468217f-218e-4cf3-890c-378c5045e7de" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/073713b2-4e73-416d-8af2-3dfd3a1ef40f" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/233cb340-4a19-4564-bf8c-7001dd82b06a" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/20cb490e-b5a7-4add-9b9b-8f7c9ca08b09" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/363fb28a-8cb9-4e73-b478-a439f4dab6a8" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/37b34874-b5a9-40ca-9d7d-f5414dad6d42" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/6ee3a7ee-4dc9-4096-a1e4-20aaf5cf2a18" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/799fff8e-45a1-4f2f-b04b-711727d9d98d" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/ddcf1d33-a625-4b38-9307-09d7bfafb440" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/c89b0756-f927-4d92-939c-fe55b0a1f326" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/5ebbfa7a-9a78-4e5c-971e-599a475bc291" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/c21db12b-999a-405f-bec0-a702492d1b98" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/799d6d65-c005-4409-a850-eac0b6af61f7" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/2a74d443-7504-43b6-89ae-2a29c69dee04" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/41768b47-58fc-4eaa-b4ef-5150abec1266" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/8f6383c1-7d2d-44f6-933d-2ce18b6071fa" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/6e7818a9-76cf-4887-a342-992cbc30eb41" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/819374b9-3499-4b56-bef3-c0cc2549d667" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/b17bc636-67ee-44b6-90b1-aad0f58f5a53" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/7accafc7-4d61-4495-b43d-df1bfb7303b4" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/e8724307-b8c0-41f5-a50b-9b320194eb92" alt="GestosAndroid" width="250px">
<img src="https://github.com/user-attachments/assets/611bc0c8-6a3f-48c0-adf4-96ce91c0090d" alt="GestosAndroid" width="250px">

## Instrucciones para el Modelo AI
El modelo AI se encuentra en el directorio `ModelAI/Model2.0`. Para ejecutar el sistema de traducción basado en inteligencia artificial, hay que seguir los siguientes pasos:

### 1. Instalar dependencias

Primero, hay que asegurarse de que esté Python instalado. Luego, ejecutar el siguiente comando para instalar todas las dependencias del archivo `requirements.txt`:

```bash
pip install -r ModelAI/Model2.0/requirements.txt
```

### 2. Recolectar imágenes

Si se desea recolectar nuevas imágenes para el conjunto de datos, ejecutar el siguiente script:

```bash
python ModelAI/Model2.0/collect_imgs.py
```

### 3. Crear el conjunto de datos

Para generar el conjunto de datos a partir de las imágenes recolectadas, ejecutar el siguiente comando:

```bash
python ModelAI/Model2.0/create_dataset.py
```

### 4. Entrenar el modelo

Para entrenar el modelo de clasificación con el conjunto de datos generado, ejecutar el siguiente comando:

```bash
python ModelAI/Model2.0/train_classifier.py
```

### 5. Realizar inferencias o probar el modelo

Si se desea probar el modelo o realizar inferencias sobre un nuevo conjunto de datos, se puede ejecutar el siguiente script:

```bash
python ModelAI/Model2.0/inference_classifier.py
```

## Ejecución del Frontend en Flutter
El frontend de este proyecto está desarrollado en Flutter. Si se desea visualizar la interfaz gráfica y probar el sistema, se debe tener descargado [Flutter]([app-release.apk](https://docs.flutter.dev/get-started/install?_gl=1*qfiir3*_gcl_aw*R0NMLjE3MjkzMTkwNDIuQ2p3S0NBandqc2k0QmhCNUVpd0FGQUwwWUJ3ekpMUVJMYmpDX0R5NDdJMGpnU3lhdHlYYUZuVkFQbjc2WFlsTHhZN1RhUVl2cE5XT3dCb0N3U1VRQXZEX0J3RQ..*_gcl_dc*R0NMLjE3MjkzMTkwNDIuQ2p3S0NBandqc2k0QmhCNUVpd0FGQUwwWUJ3ekpMUVJMYmpDX0R5NDdJMGpnU3lhdHlYYUZuVkFQbjc2WFlsTHhZN1RhUVl2cE5XT3dCb0N3U1VRQXZEX0J3RQ..*_up*MQ..*_ga*MTM0ODE2Nzk3MS4xNzA0Nzc1Njgx*_ga_04YGWK0175*MTcyOTMxOTA0MS41OS4wLjE3MjkzMTkwNDEuMC4wLjA.&gclid=CjwKCAjwjsi4BhB5EiwAFAL0YBwzJLQRLbjC_Dy47I0jgSyatyXaFnVAPn76XYlLxY7TaQYvpNWOwBoCwSUQAvD_BwE&gclsrc=aw.ds)) y seguir estos pasos:

### 1. Dirigirse al directorio del frontend

Navegar al directorio del frontend:

```bash
cd Frontend/sign_language_translator
```

### 2. Instalar dependencias de Flutter

Instalar las dependencias necesarias ejecutando el siguiente comando:

```bash
flutter pub get
```

### 3. Ejecutar la aplicación Flutter

Para iniciar la aplicación en un dispositivo o emulador Android, ejecutar el siguiente comando:

```bash
flutter run
```

### Requisitos

- Flutter: Versión 3.24.3 o superior
- Dart: Versión 3.5.3 o superior
- Dispositivo Android: Debe estar conectado y configurado para depuración


## Ejecución del Backend
El backend de este sistema se encarga de procesar las inferencias y está desarrollado en Python. Seguir estos pasos para iniciar el servidor:

### 1. Instalar dependencias

Primero, hay que asegurarse de que esté Python instalado. Luego, ejecutar el siguiente comando para instalar todas las dependencias del archivo `requirements.txt`:

```bash
pip install -r Backend/inference_server/requirements.txt
```

### 2. Dirigirse al directorio del backend

Navegar al directorio del backend:

```bash
cd Backend/inference_server/app
```


### 3. Ejecutar el servidor

Para iniciar el servidor, ejecutar el siguiente script:

```bash
python server.py
```

### 4. Desplegar el servidor con Ngrok (Opcional para la app)

Para usar la app, es mejor usar el servicio de despliegue de [ngrok](https://dashboard.ngrok.com/get-started/setup/windows) y pasar esa url en las conexiones de la app para conectarse de manera segura.
En la consola de ngrok ejecutar:

```bash
ngrok http http://localhost:5000
```




