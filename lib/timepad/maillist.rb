module Timepad
  class Maillist < Base

    def initialize(timepad_client)
      @client = timepad_client
    end

    # Get all maillists
    #
    # @return [Array]
    def get_list
      request 'getlist'
    end

    # Get maillist subscribers
    #
    # @param maillist_id [String] maillist id
    # @return [Array]
    def get maillist_id
      request 'get', :maillist => maillist_id
    end

    # Add maillist subscribers
    #
    # @param maillist_id [String] maillist id
    # @param subscribers [Array]
    def add_items maillist_id, subscribers
      if subscribers.kind_of? Hash
        subscribers = [subscribers]
      end

      params = subscribers_to_hash(subscribers)
      params[:m_id] = maillist_id

      request 'add_items', params
    end

    # Create maillist
    #
    # @param title [String] maillist title
    # @param subscribers [Array] maillist initial subscribers
    def create title, subscribers
      params = subscribers_to_hash(subscribers)
      params[:name] = title

      request 'create', params
    end
  end
end
