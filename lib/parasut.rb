require 'her'
require 'json'
require 'uri'
require 'rest_client'
require 'pry'

module Her
  module Middleware
    class OAuthProviderHeader < Faraday::Middleware
      def add_header(headers)
        headers.merge! Authorization: "Bearer #{refresh_token['access_token']}"
      end

      def refresh_token
        resp = RestClient.post("#{token_url}?#{URI.encode_www_form(refresh_token_params)}", {})
        JSON.parse(resp)
      end

      def refresh_token_params
        {
          client_id: ENV['PARASUT_CLIENT_ID'],
          client_secret: ENV['PARASUT_CLIENT_SECRET'],
          grant_type: 'refresh_token',
          refresh_token: password['refresh_token']
        }
      end

      def password_params
        {
          client_id: ENV['PARASUT_CLIENT_ID'],
          client_secret: ENV['PARASUT_CLIENT_SECRET'],
          username: ENV['PARASUT_USERNAME'],
          password: ENV['PARASUT_PASSWORD'],
          grant_type: 'password',
          redirect_uri: 'urn:ietf:wg:oauth:2.0:oob'
        }
      end

      def token_url
        'https://api.parasut.com/oauth/token'
      end

      def password
        resp = RestClient.post("#{token_url}?#{URI.encode_www_form(password_params)}", {})
        JSON.parse(resp)
      end

      def call(env)
        add_header(env[:request_headers])
        @app.call(env)
      end
    end
  end
end

class ParasutParser < Her::Middleware::DefaultParseJSON
  def parse(body)
    json = parse_json(body)
    {
      data: json[:items] || {},
      errors: json[:errors] || [],
      metadata: json[:meta] || {},
    }
  end
end

Her::API.setup url: "https://api.parasut.com/v1/#{ENV['PARSUT_COMPANY_ID']}" do |config|
  config.use ParasutParser
  config.use Faraday::Request::UrlEncoded
  config.use Her::Middleware::OAuthProviderHeader
  config.use Faraday::Adapter::NetHttp
end

require_relative 'parasut/version'
require_relative 'parasut/options'
require_relative 'parasut/product'

# lib/parasut.rb
module Parasut
end
