module Timepad
  class Category < Base

    # Get all categories
    #
    # @return [Array]
    def self.get_list
      request('getlist')
    end

  end
end
