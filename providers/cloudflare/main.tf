provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

resource "cloudflare_zone" "sample" {
  zone = var.cloudflare_zone
}

# Uncomment resources below as needed:

# resource "cloudflare_record" "www" {
#   zone_id = cloudflare_zone.sample.id
#   name    = "www"
#   value   = "192.0.2.1"
#   type    = "A"
#   ttl     = 3600
# }

# resource "cloudflare_page_rule" "redirect" {
#   zone_id  = cloudflare_zone.sample.id
#   target   = "example.com/*"
#   actions {
#     forwarding_url {
#       url         = "https://www.example.com"
#       status_code = 301
#     }
#   }
# }
