module Her
  module Middleware
    # ParasutParser
    class ParasutParser < Her::Middleware::DefaultParseJSON
      def parse(body)
        json = parse_json(body)
        {
          data: json[:items] || {},
          errors: json[:errors] || [],
          metadata: json[:meta] || {}
        }
      end
    end
  end
end
