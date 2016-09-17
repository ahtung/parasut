# lib/parasut/contact.rb
module Parasut
  # Contact
  class Contact
    include Her::Model
    extend Parasut::Paginated
    include_root_in_json true
  end
end
