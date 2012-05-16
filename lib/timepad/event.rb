module Timepad
  class Event < Base

    # Get all events
    #
    # @param [Hash{cat_id => String, limit => String, order_by =>String}]
    # @return [Array]
    def self.get_list params = {}
      request('getlist', params)
    end

    # Get event by event_id
    #
    # @param [String] event_id
    # @return [Array]
    def self.get event_id
      request('get', :e_id => event_id)
    end

  end
end
