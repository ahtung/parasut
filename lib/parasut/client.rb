module Parasut
  # Parasut::Client
  class Client
    API_VERSION = 'v1'.freeze
    BASE_URL = 'https://api.parasut.com'.freeze

    def initialize
    end

    def me
      RestClient.get("#{BASE_URL}/#{API_VERSION}/me", Authorization: "Bearer #{refresh_token['access_token']}")
    end

    private

    def refresh_token
      resp = RestClient.post("#{BASE_URL}?#{URI.encode_www_form(refresh_token_params)}", {})
      JSON.parse(resp)
    end

    def password
      resp = RestClient.post("#{BASE_URL}?#{URI.encode_www_form(password_params)}", {})
      JSON.parse(resp)
    end

    def refresh_token_params
      {
        client_id: Parasut.options.client_id,
        client_secret: Parasut.options.client_secret,
        grant_type: 'refresh_token',
        refresh_token: password['refresh_token']
      }
    end

    def password_params
      {
        client_id: Parasut.options.client_id,
        client_secret: Parasut.options.client_secret,
        username: Parasut.options.username,
        password: Parasut.options.password,
        grant_type: 'password',
        redirect_uri: 'urn:ietf:wg:oauth:2.0:oob'
      }
    end
  end
end
