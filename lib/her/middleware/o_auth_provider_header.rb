module Her
  module Middleware
    # OAuthProviderHeader
    class OAuthProviderHeader < Faraday::Middleware
      def add_header(headers)
        headers.merge! Authorization: "Bearer #{refresh_token['access_token']}"
      end

      def refresh_token
        uri = URI("#{token_url}?#{URI.encode_www_form(refresh_token_params)}")
        res = Net::HTTP.post_form(uri, {})
        JSON.parse(res.body)
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

      def token_url
        'https://api.parasut.com/oauth/token'
      end

      def password
        uri = URI("#{token_url}?#{URI.encode_www_form(password_params)}")
        res = Net::HTTP.post_form(uri, {})
        JSON.parse(res.body)
      end

      def call(env)
        add_header(env[:request_headers])
        @app.call(env)
      end
    end
  end
end
