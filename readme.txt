# LumenSelah

LumenSelah es una aplicación móvil desarrollada en Flutter, concebida como un refugio digital para la lectura serena, el estudio reflexivo de la Biblia y el crecimiento espiritual constante mediante un entorno de aprendizaje interactivo.

Nuestra misión es proporcionar una herramienta que elimine las distracciones del mundo moderno y permita a los usuarios enfocarse únicamente en el texto bíblico y su desarrollo personal, asegurando siempre el respeto absoluto a su concentración y privacidad.

---

## 🌟 Características Principales

### 📖 Lector Bíblico Minimalista
Experimenta la lectura de la Biblia sin interrupciones. Hemos creado una interfaz limpia y libre de ruidos visuales.
- **Enfoque Reflexivo:** Diseño guiado por la paleta de colores "Reflective Dawn", ideada para transmitir paz y no cansar la vista durante lecturas prolongadas.
- **Gestión Intuitiva:** Resaltado interactivo de versículos y navegación fluida y rápida entre diferentes libros y capítulos.

### 🧩 Sistema de Lecciones y Cuestionarios (Quizzes)
LumenSelah no es solo para leer, sino también para aprender y meditar.
- **Ruta de Aprendizaje:** Sigue un camino estructurado y progresivo de lecciones diseñadas para profundizar en los temas bíblicos.
- **Evaluación Activa:** Pon a prueba tu comprensión y retención mediante cuestionarios (quizzes) integrados al finalizar cada lección.

### 🔥 Rastreo de Hábitos y Rachas (Streaks)
Construir un hábito diario es fundamental para el crecimiento espiritual.
- **Motivación Constante:** La aplicación lleva un registro preciso de los días consecutivos en los que has completado tus lecciones.
- **Seguimiento Visual:** Consulta tu progreso semanal para mantenerte motivado y no romper tu racha de estudio.

### 🌗 Soporte Dinámico para Temas (Modo Claro / Oscuro)
Una lectura cómoda en cualquier condición de iluminación. La interfaz soporta completamente modos claro y oscuro, ajustándose a las preferencias de tu sistema para cuidar tus ojos en todo momento.

### 🔒 100% Offline y Privacidad Absoluta
Entendemos el valor de tu privacidad y la importancia de poder estudiar en cualquier lugar, sin depender de la señal del teléfono.
- **Cero Dependencia de Internet:** LumenSelah no hace llamadas a APIs externas en la nube ni telemetría. La aplicación está diseñada para funcionar íntegramente de manera local.
- **Almacenamiento Local Seguro:** Los textos bíblicos, tu progreso evolutivo, tus rachas (streaks) y configuraciones se guardan de forma única y exclusiva en el almacenamiento interno de tu dispositivo.
- **Libertad Total:** Úsala en modo avión, en tu viaje al trabajo, en lugares recónditos, o simplemente con la profunda tranquilidad de que tu información y hábitos de usuario nunca abandonan tu teléfono.

---

## 🛠 Tecnologías Utilizadas

Bajo el capó, LumenSelah aprovecha componentes modernos y rinden a gran nivel para garantizar una experiencia de usuario rápida y fluida:

- **Frontend:** Desarrollado con el framework **Flutter** y lenguaje **Dart**, permitiendo animaciones fluidas y una experiencia impecable tanto en iOS como en Android.
- **Bases de Datos Locales:** Se utiliza **SQLite (sqflite)** para indexar y buscar ágilmente entre miles de versículos bíblicos de manera instantánea (cero latencia de red); y **SharedPreferences** para el guardado ligero de métricas de usuario como las rachas y configuraciones de la interfaz.
- **Diseño UI/UX:** Creada con componentes de **Material Design**, enriquecidos con tipografías personalizadas (Google Fonts) para una legibilidad excepcional.

---

## 🚀 Configuración del Entorno de Desarrollo

Para aquellos desarrolladores que deseen compilar la aplicación por sí mismos:

### Prerrequisitos
Asegúrate de contar con el SDK de Flutter instalado (versión ^3.11.1 o compatible).

### Pasos
1. **Clona este repositorio** en tu entorno de trabajo:
   ```bash
   git clone <tu-repositorio>
   cd LumenSelah
   ```
2. **Instala las dependencias** de packages en Dart:
   ```bash
   flutter pub get
   ```
3. **Ejecuta la aplicación** usando un emulador o un dispositivo físico conectado:
   ```bash
   flutter run
   ```

---

*LumenSelah: Iluminando tu estudio con calma, privacidad y sin distracciones.*
