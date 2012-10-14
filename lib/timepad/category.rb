module Timepad
  class Category < Base
    def initialize(timepad_client)
      @client = timepad_client
    end


    # Get all categories
    #
    # @return [Array]
    def get_list
      request 'getlist'
    end

  end
end
