module Parasut
  # Paginated
  module Paginated
    def new_collection(parsed_data)
      pagination = parsed_data[:metadata]
      collection = Her::Model::Attributes.initialize_collection(self, parsed_data)
      Kaminari.paginate_array(collection, total_count: pagination[:item_count]).page(pagination[:page_count]).per(pagination[:per_page])
    end
  end
end
