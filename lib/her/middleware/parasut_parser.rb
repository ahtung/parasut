module Her
  module Middleware
    # ParasutParser
    class ParasutParser < Her::Middleware::DefaultParseJSON
      def parse(body)
        json = parse_json(body)
        data = json
        # TODO: (dunyakirkali) :transactions exception should be removed
        data = data[:transactions].present? ? data[:transactions] : data if data[:account].blank?
        data = data[:items].present? ? data[:items] : data
        {
          data: data || {},
          errors: json[:errors] || [],
          metadata: json[:meta] || {}
        }
      end
    end
  end
end
