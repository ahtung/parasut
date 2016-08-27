require 'faraday'

module Parasut
  # lib/parasut/client.rb
  class Client
    def initialize
      options = Parasut::Options.new

      connection = Faraday.new url: options.authorize_url do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      response = connection.post do |req|
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = {
          client_id: URI.encode(options.client_id),
          client_secret: URI.encode(options.client_secret),
          username: URI.encode(options.username),
          password: URI.encode(options.password),
          grant_type: URI.encode(options.grant_type),
          redirect_uri: URI.encode(options.redirect_uri)
        }
        Rails.logger.info "Body #{req.body.inspect}"
      end
      Rails.logger.info "Body #{response}"
    end
  end
end
