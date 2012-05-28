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
      params.map{|key, value| value.nil? ? "" : "#{key}=#{value}"}.join('&')
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
        params[ "i#{i}_email".to_sym ] = subscriber[:email]
        params[ "i#{i}_name".to_sym ] = subscriber[:name] if subscriber.has_key?(:name)
        params[ "i#{i}_surname".to_sym ] = subscriber[:surname] if subscriber.has_key?(:surname)
        params[ "i#{i}_middlename".to_symbol ] = subscriber[:middlename] if subscriber.has_key?(:middlename)
        params[ "i#{i}_company".to_symbol ] = subscriber[:company] if subscriber.has_key?(:company)
        params[ "i#{i}_phone".to_symbol ] = subscriber[:phone] if subscriber.has_key?(:phone)
        params[ "i#{i}_comment".to_symbol ] = subscriber[:comment] if subscriber.has_key?(:comment)

        i += 1
      end
      params
    end
  end
end
