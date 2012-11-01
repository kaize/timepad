require 'json'
require 'net/http'

module Timepad
  class Base
    def request(action, params = {})
      uri = make_uri(action, params)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    def make_query(params)
      params.map{|key, value| value.nil? ? "" : "#{key}=#{URI::encode value.to_s}"}.join('&')
    end

    def make_uri(action, params = {})
      params.merge!({'id' => @client.id, 'code' => @client.key})
      query = make_query(params)
      object = self.class.name.split('::').last.downcase
      URI("#{Timepad.endpoint.downcase}#{object}_#{action}?#{query}")
    end

    # Convert Array of Hash to Hash
    #
    # @param subscribers [Array]
    # @return [Hash]
    def subscribers_to_hash(subscribers)
      i = 0
      params = {}
      subscribers.each do |subscriber|
        next if subscriber[:email].empty?
        %w(email name surnname middlename company phone comment).each do |key|
          if subscriber[key.to_sym]
            params[ "i#{i}_#{key}".to_sym ] = subscriber[key.to_sym]
          end
        end
        i += 1
      end
      params
    end
  end
end
