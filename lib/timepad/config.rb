module Timepad
  module Config

    DEFAULT_ENDPOINT = 'http://timepad.ru/api/'

    DEFAULT_ID = nil

    DEFAULT_KEY = nil

    VALID_OPTIONS_KEYS = [
      :id,
      :key,
      :endpoint
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    #
    # @return [Hash]
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    def reset
      self.id       = DEFAULT_ID
      self.key      = DEFAULT_KEY
      self.endpoint = DEFAULT_ENDPOINT
      self
    end
  end
end
