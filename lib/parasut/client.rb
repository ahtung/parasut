module Parasut
  # Parasut::Client
  class Client
    API_VERSION = 'v1'.freeze
    BASE_URL = 'https://api.parasut.com'.freeze

    def me
      RestClient.get([BASE_URL, API_VERSION, 'me'].join('/'), headers)
    end

    def get(url)
      puts [BASE_URL, API_VERSION, url].join('/')
      RestClient.get([BASE_URL, API_VERSION, url].join('/'), headers)
    end

    def refresh_token
      resp = RestClient.post("#{token_url}?#{URI.encode_www_form(refresh_token_params)}", {})
      JSON.parse(resp)
    end

    private

    def password
      resp = RestClient.post("#{token_url}?#{URI.encode_www_form(password_params)}", {})
      JSON.parse(resp)
    end

    def token_url
      "#{BASE_URL}/oauth/token"
    end

    def headers
      { Authorization: "Bearer #{refresh_token['access_token']}" }
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
