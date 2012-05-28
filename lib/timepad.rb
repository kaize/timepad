require 'json'
require 'net/http'
require 'active_support/core_ext/enumerable'

module Timepad
  autoload :Base,     'timepad/base'
  autoload :Version,  'timepad/version'
  autoload :Maillist, 'timepad/maillist'
  autoload :Mail,     'timepad/mail'
  autoload :Event,    'timepad/event'
  autoload :Category, 'timepad/category'
  autoload :Config,   'timepad/config'
  autoload :Client,   'timepad/client'
  extend Config

  def self.maillist
    client
    @client.maillist
  end

  def self.mail
    client
    @client.mail
  end

  def self.category
    client
    @client.category
  end

  def self.event
    client
    @client.event
  end

  def self.client(attrs = {})
    if !@client
      @client = Timepad::Client.new(attrs)
    end
    @client
  end

end
