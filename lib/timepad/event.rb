module Timepad
  class Event < Base

    def initialize(timepad_client)
      @client = timepad_client
    end

    # Get all events
    #
    # @param [Hash{cat_id => String, limit => String, order_by =>String}]
    # @return [Array]
    def get_list(attrs = {})
      request 'getlist', attrs
    end

    # Get event by event_id
    #
    # @param [String] event_id
    # @return [Array]
    def get(event_id)
      request 'get', :e_id => event_id
    end

    # Get event subscribers
    #
    # @params [String] event_id
    # @return [Array]
    def export(event_id)
      request 'export', :e_id => event_id
    end

    # Create event
    #
    # @params [Hash]
    # @return [Array]
    def create(attrs)
      request 'create', attrs
    end

    def register(attrs)
      request 'register', attrs
    end

  end
end
