module Timepad
  class Maillist < Base

    # Get all maillists
    #
    # @return [Array]
    def self.get_list
      request('getlist')
    end

    # Get maillist subscribers
    #
    # @param [String] maillist id
    # @return [Array]
    def self.get maillist_id
      request('get', :maillist => maillist_id)
    end

  end
end
