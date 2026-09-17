# Veterinario a Domicilio Aspe — sitio web

Página web de una sola página (landing) para un servicio veterinario a domicilio en Aspe (Alicante).
Construida con Ruby on Rails 8.1, Propshaft e importmap, igual que el resto de proyectos de la carpeta.

## Arrancar en local

```bash
bundle install
bin/rails server
```

Abre http://localhost:3000.

## Cambiar el número de WhatsApp

El número se lee de la variable de entorno `WHATSAPP_NUMBER`. En desarrollo se carga desde `.env`
(gema `dotenv-rails`, el fichero no se sube a git):

```bash
cp .env.example .env
# edita .env
WHATSAPP_NUMBER=34600000000   # formato internacional, solo dígitos
```

En producción define `WHATSAPP_NUMBER` en el entorno del servidor.
El nombre del negocio y la zona de servicio se cambian en `config/initializers/site.rb`.

## Añadir las imágenes

Las imágenes están vacías a propósito. Cada hueco está marcado con el helper
`image_placeholder("...")` en `app/views/pages/home.html.erb`.

1. Guarda la imagen en `app/assets/images/` (por ejemplo `hero.jpg`).
2. Sustituye la llamada al placeholder por un `image_tag`:

```erb
<%# antes %>
<%= image_placeholder("Imagen principal: veterinario con mascota en casa", css_class: "img-placeholder--hero") %>

<%# después %>
<%= image_tag "hero.jpg", alt: "Veterinario atendiendo a un perro en casa", class: "hero__image" %>
```

Huecos disponibles:

| Sección            | Placeholder                                | Tamaño sugerido |
|--------------------|--------------------------------------------|-----------------|
| Hero               | Imagen principal                           | 1200 × 900      |
| Servicios (×6)     | Icono de cada servicio                     | 144 × 144       |
| Por qué a domicilio| Mascota tranquila en casa                  | 900 × 1200      |
| Zona               | Mapa de la zona de servicio                | 1600 × 700      |

## Estructura

- `app/views/pages/home.html.erb` — todo el contenido de la página.
- `app/views/layouts/application.html.erb` — cabecera, pie y botón flotante de WhatsApp.
- `app/helpers/application_helper.rb` — helpers de WhatsApp y placeholders.
- `app/assets/stylesheets/` — `variables.css`, `application.css`, `components/`, `views/`.

## Desplegar con Kamal

Requisitos: Docker en tu Mac, un servidor Linux con SSH como `root` (o un usuario con sudo) y un
dominio apuntando a la IP del servidor.

1. Edita `config/deploy.yml`: IP del servidor (`servers.web`), dominio (`proxy.host`),
   usuario del registro (`image` y `registry.username`) y `WHATSAPP_NUMBER`.
2. Exporta el token del registro (Docker Hub → Account settings → Personal access tokens):
   ```bash
   export KAMAL_REGISTRY_PASSWORD=dckr_pat_...
   ```
3. Primera vez (instala Docker en el servidor, arranca el proxy y despliega):
   ```bash
   bin/kamal setup
   ```
4. Siguientes despliegues:
   ```bash
   bin/kamal deploy
   ```

Útiles: `bin/kamal logs`, `bin/kamal console`, `bin/kamal shell`, `bin/kamal app details`.
