# lib/parasut/document_status.rb
module Parasut
  # Contact
  class DocumentStatus
    include Her::Model
    belongs_to :sales_invoice
  end
end
