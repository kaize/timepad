require 'json'
require 'net/http'

module Timepad
  class Base
    def self.request(action, params = {})
      uri = make_uri(action, params)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    def self.make_query(params)
      params.map{|key, value| value.nil? ? "" : "#{key}=#{value}"}.join('&')
    end

    def self.make_uri(action, params = {})
      params.merge!({'id' => Timepad.id, 'code' => Timepad.key})
      query = make_query(params)
      object = self.name.split('::').last.downcase
      URI("#{Timepad.endpoint.downcase}#{object}_#{action}?#{query}")
    end
  end
end
