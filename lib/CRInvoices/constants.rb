module CRInvoices
  PRODUCTION_BASE_URL = "https://api.comprobanteselectronicos.go.cr/recepcion/v1/"
  STAGING_BASE_URL = "https://api.comprobanteselectronicos.go.cr/recepcion-sandbox/v1/"

  PRODUCTION_AUTH_URL = "https://idp.comprobanteselectronicos.go.cr/auth/realms/rut/protocol/openid-connect/token"
  STAGING_AUTH_URL = "https://idp.comprobanteselectronicos.go.cr/auth/realms/rut-stag/protocol/openid-connect/token"

  PRODUCTION_CLIENT_ID = "api-prod"
  STAGING_CLIENT_ID = "api-stag"

end
