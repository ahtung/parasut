# lib/parasut/product.rb
module Parasut
  # Product
  class Product
    include Her::Model
    include Parasut::Paginated
    include_root_in_json true
  end
end
