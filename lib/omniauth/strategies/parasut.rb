module OmniAuth
  module Strategies
    # lib/omniauth/strategies/parasut.rb
    class Parasut < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'parasut'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, site: 'https://api.parasut.com'

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { api.current_user.id }

      info { api.current_user }

      def api
        @api ||= ParasutApi.new access_token
      end
    end
  end
end
