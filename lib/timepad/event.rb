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

    # Get event members
    #
    # @params [String] event_id
    # @return [Array]
    def export(event_id, attrs = nil)
      request_attrs = {:e_id => event_id}
      request_attrs.merge!(attrs) unless attrs.nil?
      request 'export', request_attrs
    end

    # Create event
    #
    # @params [Hash{name => String, }]
    # @return [Array]
    def create(attrs)
      request 'create', attrs
    end

    # Register event member
    #
    # @params [Hash{e_id => String, re_id => String, mail => String}]
    # @retur [Array]
    def register(attrs)
      request 'register', attrs
    end

  end
end
