# 🦷 Portafolio Dental CAD/CAM Profesional

Sistema de portafolio web dinámico para visualización de casos dentales digitales diseñados en Exocad. Arquitectura modular con páginas individuales por paciente, visualizador 3D integrado y galería de imágenes.

🌐 **[Ver Demo en Vivo](https://TU-USUARIO.github.io/dental-portfolio)**

-----

## ✨ Características

- 🎨 **Diseño Dark Mode Premium** - Estética médico-tecnológica de alto nivel
- 🔍 **Búsqueda y Filtros** - Encuentra casos por nombre, código o tipo
- 👤 **Páginas Individuales** - Vista detallada de cada paciente con tabs navegables
- 🖼️ **Visualizador 3D** - Iframe fullscreen para archivos HTML interactivos de Exocad
- 📸 **Galería con Lightbox** - Navegación suave entre imágenes con teclado
- 💾 **Descarga Directa** - Integración con Google Drive para archivos .CAD
- 📱 **100% Responsive** - Funciona en móvil, tablet y desktop
- ⚡ **Sin Dependencias** - Vanilla JavaScript puro, sin frameworks
- 🚀 **GitHub Pages Ready** - Deploy automático en 2 minutos

-----

## 🚀 Instalación Rápida

### Paso 1: Clonar o Descargar

```bash
# Opción 1: Clonar repositorio
git clone https://github.com/TU-USUARIO/dental-portfolio.git
cd dental-portfolio

# Opción 2: Descargar ZIP y extraer
```

### Paso 2: Estructura Inicial

Crea la estructura de carpetas base:

```bash
mkdir -p patients/patient-001/gallery
mkdir -p patients/patient-002/gallery
```

### Paso 3: Subir a GitHub

```bash
git init
git add .
git commit -m "Initial commit: Dental CAD/CAM Portfolio"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/dental-portfolio.git
git push -u origin main
```

### Paso 4: Activar GitHub Pages

1. Ve a tu repositorio en GitHub
1. **Settings** → **Pages**
1. Source: `main` branch, `/root`
1. **Save**
1. Espera 2-3 minutos

✅ **Tu sitio estará en:** `https://TU-USUARIO.github.io/dental-portfolio`

-----

## 📁 Estructura del Proyecto

```
dental-portfolio/
│
├── index.html              # Página principal (grid de pacientes)
├── patient.html            # Template de página individual
├── README.md              # Este archivo
│
├── css/
│   └── styles.css         # Estilos globales
│
├── js/
│   └── patients-data.js   # ⭐ BASE DE DATOS (solo editas aquí)
│
└── patients/              # Carpeta de casos
    ├── patient-001/
    │   ├── cover.jpg      # Foto de portada
    │   ├── exocad.html    # Archivo Exocad interactivo
    │   └── gallery/       # Galería de imágenes
    │       ├── img-1.jpg
    │       ├── img-2.jpg
    │       └── img-3.jpg
    │
    ├── patient-002/
    │   └── ...
    │
    └── patient-003/
        └── ...
```

-----

## 🎯 Cómo Agregar un Nuevo Caso

### 1️⃣ Prepara tus Archivos

- ✅ Exporta el caso desde Exocad como HTML
- ✅ Captura una imagen de portada (render o screenshot)
- ✅ Guarda imágenes adicionales para la galería (opcional)
- ✅ Sube el archivo .CAD a Google Drive y obtén el link público

### 2️⃣ Crea la Estructura de Carpetas

```bash
# Ejemplo para el paciente 005
mkdir patients/patient-005
mkdir patients/patient-005/gallery

# Copia tus archivos
cp ruta/caso-exocad.html patients/patient-005/exocad.html
cp ruta/portada.jpg patients/patient-005/cover.jpg
cp ruta/render1.jpg patients/patient-005/gallery/img-1.jpg
```

### 3️⃣ Edita la Base de Datos

Abre `js/patients-data.js` y agrega tu caso:

```javascript
const PATIENTS_DATA = [
    // ... casos existentes ...
    
    , // ← No olvides la coma
    {
        id: "patient-005",
        name: "Rehabilitación Full Arch Inferior",
        code: "RH-2025-005",
        type: "rehabilitacion", // rehabilitacion, implantes, estetica, ferulas
        date: "Enero 2025",
        description: "Arcada inferior completa con 12 unidades sobre 4 implantes.",
        
        coverImage: "patients/patient-005/cover.jpg",
        exocadFile: "patients/patient-005/exocad.html",
        driveLink: "https://drive.google.com/file/d/TU_ID_REAL/view",
        
        gallery: [
            "patients/patient-005/gallery/img-1.jpg",
            "patients/patient-005/gallery/img-2.jpg"
        ],
        
        galleryCount: 2
    }
];
```

### 4️⃣ Sube los Cambios

```bash
git add .
git commit -m "Nuevo caso: patient-005 - Rehabilitación Full Arch"
git push
```

⏱️ **En 1-2 minutos** el caso aparecerá en tu portafolio.

-----

## 🎨 Tipos de Casos Soportados

|Tipo          |Valor           |Icono|Uso                              |
|--------------|----------------|-----|---------------------------------|
|Rehabilitación|`rehabilitacion`|🔬    |Prótesis fijas, arcadas completas|
|Implantes     |`implantes`     |⚙️    |Barras, pilares, estructuras     |
|Estética      |`estetica`      |✨    |Carillas, coronas estéticas      |
|Férulas       |`ferulas`       |🛡️    |Férulas oclusales, dispositivos  |
|Ortodoncia    |`ortodoncia`    |📐    |Alineadores, retenedores         |

-----

## 🔧 Personalización

### Cambiar Colores del Tema

En `css/styles.css`, línea ~12:

```css
:root {
    --primary: #0ea5e9;       /* Azul principal */
    --secondary: #8b5cf6;     /* Morado secundario */
    --accent: #10b981;        /* Verde acento */
}
```

### Agregar Nuevo Tipo de Caso

1. En `js/patients-data.js`, usa el nuevo valor en `type`
1. En `patient.html` y `index.html`, agrega el badge en la función `getTypeBadge()`:

```javascript
function getTypeBadge(type) {
    const badges = {
        // ... existentes ...
        nuevotipo: '🔧 Nuevo Tipo'
    };
    return badges[type] || '📋 Caso Dental';
}
```

-----

## 📊 Recomendaciones Técnicas

### Tamaños de Archivo

|Elemento           |Recomendado|Máximo|
|-------------------|-----------|------|
|Imagen de portada  |800x600px  |2MB   |
|Imágenes de galería|1200x900px |2MB   |
|Archivo Exocad HTML|Optimizado |10MB  |

### Nomenclatura

- **Carpetas:** `patient-001`, `patient-002`, etc. (3 dígitos)
- **Portada:** Siempre `cover.jpg` o `cover.png`
- **Exocad:** Siempre `exocad.html`
- **Galería:** Nombres libres (`img-1.jpg`, `render-frontal.jpg`)

-----

## 🔒 Privacidad y Seguridad

⚠️ **IMPORTANTE:** Este portafolio es público en internet.

- ❌ NO uses nombres reales de pacientes
- ❌ NO incluyas información personal identificable
- ✅ Usa códigos internos (RH-2025-001, IM-2024-015)
- ✅ Usa nombres genéricos (“Rehabilitación Full Arch”)
- ✅ Remueve metadatos EXIF de las imágenes

-----

## 🛠️ Stack Tecnológico

- **HTML5** - Estructura semántica moderna
- **CSS3** - Variables CSS, Grid, Flexbox, animaciones
- **JavaScript (Vanilla)** - Sin frameworks ni librerías
- **GitHub Pages** - Hosting gratuito y confiable

-----

## 📱 Navegadores Soportados

- ✅ Chrome/Edge 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Mobile (iOS Safari, Chrome Android)

-----

## 🐛 Troubleshooting

### Problema: Imágenes no se cargan

**Solución:** Verifica que las rutas en `patients-data.js` coincidan exactamente con los nombres de archivo (case-sensitive).

### Problema: Iframe de Exocad en blanco

**Solución:** Verifica que el HTML exportado sea válido. Abre `exocad.html` directamente en el navegador para probarlo.

### Problema: Botón de descarga no funciona

**Solución:** Asegúrate de que el link de Drive sea público y tenga el formato correcto: `https://drive.google.com/file/d/ID/view`

### Problema: “Paciente no encontrado”

**Solución:** Verifica que el `id` en la base de datos sea único y coincida exactamente con el patrón `patient-XXX`.

-----

## 📞 Comandos Git Útiles

```bash
# Ver cambios pendientes
git status

# Agregar todos los cambios
git add .

# Commit con mensaje
git commit -m "Descripción del cambio"

# Subir a GitHub
git push

# Ver historial
git log --oneline

# Deshacer último commit (sin perder cambios)
git reset --soft HEAD~1
```

-----

## 🎓 Mejores Prácticas

1. **Consistencia:** Usa el mismo formato de código en todos los casos
1. **Calidad:** Sube renders profesionales de alta resolución
1. **Actualización:** Agrega casos nuevos regularmente
1. **Organización:** Ordena por complejidad o fecha
1. **Descripciones:** Explica el workflow y materiales usados

-----

## 📄 Licencia

Este proyecto es de uso personal para portafolios profesionales.

-----

## 🤝 Contribuciones

Este es un proyecto personal, pero si encuentras bugs o tienes sugerencias:

1. Abre un Issue en GitHub
1. Describe el problema o sugerencia
1. Si es posible, adjunta screenshots

-----

## 📧 Contacto

- **Portfolio:** https://TU-USUARIO.github.io/dental-portfolio
- **GitHub:** https://github.com/TU-USUARIO
- **LinkedIn:** [Tu perfil]

-----

**Desarrollado con 🦷 para profesionales dentales CAD/CAM**

Versión 2.0.0 | Enero 2025