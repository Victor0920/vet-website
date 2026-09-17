# Site-wide settings for the veterinary website.
# The WhatsApp number comes from the WHATSAPP_NUMBER environment variable
# (see .env in development; set it on the server in production).
Rails.application.config.x.site.whatsapp_number = ENV.fetch("WHATSAPP_NUMBER")
Rails.application.config.x.site.name = "Veterinario a Domicilio Aspe"
Rails.application.config.x.site.area = "Aspe y alrededores (Alicante)"
