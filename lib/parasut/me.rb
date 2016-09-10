module Parasut
  class Me
    include Her::Model
    resource_path '/me'

    def self.singleton
      @singleton ||= find('')
    end
  end
end
