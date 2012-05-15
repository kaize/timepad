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

    def reset
      self.id       = DEFAULT_ID
      self.key      = DEFAULT_KEY
      self.endpoint = DEFAULT_ENDPOINT
      self
    end
  end
end
