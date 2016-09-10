module Parasut
  # Parasut::Client
  class Client
    def self.me
      RestClient.get([BASE_URL, API_VERSION, 'me'].join('/'), headers)
    end

    def self.get(url)
      RestClient.get([BASE_URL, API_VERSION, url].join('/'), headers)
    end

    def self.create(url, attrs)
      RestClient.post([BASE_URL, API_VERSION, url].join('/'), headers)
    end

    def self.delete(url)
      RestClient.delete([BASE_URL, API_VERSION, url].join('/'), headers)
    end

    def self.refresh_token
      resp = RestClient.post("#{token_url}?#{URI.encode_www_form(refresh_token_params)}", {})
      JSON.parse(resp)
    end

    def self.password
      resp = RestClient.post("#{token_url}?#{URI.encode_www_form(password_params)}", {})
      JSON.parse(resp)
    end

    def self.token_url
      "#{BASE_URL}/oauth/token"
    end

    def self.headers
      { Authorization: "Bearer #{refresh_token['access_token']}" }
    end

    def self.refresh_token_params
      {
        client_id: ENV['PARASUT_CLIENT_ID'],
        client_secret: ENV['PARASUT_CLIENT_SECRET'],
        grant_type: 'refresh_token',
        refresh_token: password['refresh_token']
      }
    end

    def self.password_params
      {
        client_id: ENV['PARASUT_CLIENT_ID'],
        client_secret: ENV['PARASUT_CLIENT_SECRET'],
        username: ENV['PARASUT_USERNAME'],
        password: ENV['PARASUT_PASSWORD'],
        grant_type: 'password',
        redirect_uri: 'urn:ietf:wg:oauth:2.0:oob'
      }
    end
  end
end
