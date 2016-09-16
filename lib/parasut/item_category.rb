# lib/parasut/item_category.rb
module Parasut
  # Contact
  class ItemCategory
    include Her::Model
    include Parasut::Paginated
    include_root_in_json true
  end
end
