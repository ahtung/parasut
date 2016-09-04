# lib/parasut/item_cotegory.rb
module Parasut
  # ItemCategory
  class ItemCategory
    ATTRIBUTES = [:id, :category_type, :name, :bg_color, :text_color]

    # Attributes
    attr_accessor *ATTRIBUTES

    # Initializer
    def initialize(options)
      @id = options[:id]
      @category_type = options[:category_type]
      @name = options[:name]
      @bg_color = options[:bg_color]
      @text_color = options[:text_color]
    end
  end
end
