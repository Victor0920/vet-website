# Site-wide settings for the veterinary website.
# The WhatsApp number comes from the WHATSAPP_NUMBER environment variable
# (see .env in development; set it on the server in production).
# Read with ENV[] rather than ENV.fetch so the app can boot without it
# (e.g. during `assets:precompile` in the Docker build); the helper raises
# if it is missing when a page actually needs it.
Rails.application.config.x.site.whatsapp_number = ENV["WHATSAPP_NUMBER"]
Rails.application.config.x.site.name = "Veterinario a Domicilio Aspe"
Rails.application.config.x.site.area = "Aspe y alrededores (Alicante)"
