require "CRInvoices/version"
require "CRInvoices/constants"
require "rails"
require "net/http"
require "uri"
require "json"

module CRInvoices

  def self.base_url
    @base_url = Rails.env.production? ? CRInvoices::PRODUCTION_BASE_URL : CRInvoices::STAGING_BASE_URL
  end

  def self.auth_url
    @auth_url = Rails.env.production? ? CRInvoices::PRODUCTION_AUTH_URL : CRInvoices::STAGING_AUTH_URL
  end

  def self.client_id
    @clientId = Rails.env.production? ? CRInvoices::PRODUCTION_CLIENT_ID : CRInvoices::STAGING_CLIENT_ID
  end

  def self.getAuthToken(username, password)
    uri = URI(self.auth_url)
    params = {
      client_id: self.client_id,
      username: username,
      password: password,
      client_secret: "",
      scope: "",
      grant_type: "password"
    }

    response = Net::HTTP.post_form( uri, params )

    if( response.is_a?( Net::HTTPSuccess ) )
      # your request was successful
      JSON.parse(response.body)
    else
      # your request failed
      JSON.parse(response.body)
    end
  end

end
