# Configuración de Firebase para Jugger App

## Pasos para configurar Firebase Authentication

### 1. Crear un proyecto en Firebase Console

1. Ve a [Firebase Console](https://console.firebase.google.com/)
2. Haz clic en "Crear un proyecto"
3. Ingresa el nombre del proyecto (ej: "jugger-app")
4. Habilita Google Analytics (opcional)
5. Crea el proyecto

### 2. Configurar Authentication

1. En el panel lateral, ve a "Authentication"
2. Haz clic en "Comenzar"
3. Ve a la pestaña "Sign-in method"
4. Habilita "Correo electrónico/contraseña"
5. Guarda los cambios

### 3. Configurar la aplicación Flutter

#### Para Android:

1. En Firebase Console, ve a "Configuración del proyecto" (ícono de engranaje)
2. En "Tus aplicaciones", haz clic en el ícono de Android
3. Ingresa el nombre del paquete: `com.example.jugger`
4. Descarga el archivo `google-services.json`
5. Coloca el archivo en `android/app/google-services.json`

#### Para iOS:

1. En Firebase Console, ve a "Configuración del proyecto"
2. En "Tus aplicaciones", haz clic en el ícono de iOS
3. Ingresa el ID del paquete: `com.example.jugger`
4. Descarga el archivo `GoogleService-Info.plist`
5. Coloca el archivo en `ios/Runner/GoogleService-Info.plist`

### 4. Actualizar firebase_options.dart

Después de configurar tu proyecto, actualiza el archivo `lib/firebase_options.dart` con las claves reales de tu proyecto:

```dart
// Reemplaza estos valores con los de tu proyecto Firebase
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'tu-api-key-real',
  appId: 'tu-app-id-real',
  messagingSenderId: 'tu-sender-id-real',
  projectId: 'tu-project-id-real',
  storageBucket: 'tu-project-id-real.appspot.com',
);
```

### 5. Instalar dependencias

```bash
flutter pub get
```

### 6. Ejecutar la aplicación

```bash
flutter run
```

## Funcionalidades implementadas

- ✅ Login con email y contraseña
- ✅ Registro de nuevos usuarios
- ✅ Recuperación de contraseña
- ✅ Logout
- ✅ Protección de rutas
- ✅ Manejo de estados de autenticación
- ✅ Interfaz de usuario moderna

## Estructura del código

```
lib/
├── services/
│   └── auth_service.dart          # Servicio de autenticación
├── screens/
│   ├── auth_wrapper.dart         # Wrapper de autenticación
│   ├── login_screen.dart         # Pantalla de login/registro
│   └── navigation_menu.dart      # Menú principal (protegido)
└── firebase_options.dart         # Configuración de Firebase
```

## Notas importantes

- La aplicación está configurada para funcionar en modo desarrollo
- Para producción, asegúrate de configurar las reglas de seguridad de Firebase
- El archivo `firebase_options.dart` contiene claves de ejemplo que deben ser reemplazadas
- La aplicación maneja errores de autenticación con mensajes en español

