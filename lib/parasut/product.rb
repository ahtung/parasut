# lib/parasut/product.rb
module Parasut
  # Product
  class Product
    include Her::Model
    extend Parasut::Paginated
    include_root_in_json true
    parse_root_in_json true
  end
end
