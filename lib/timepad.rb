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
    client.maillist
  end

  def self.mail
    client.mail
  end

  def self.category
    client.category
  end

  def self.event(id = nil)
    event = client.event
    id.nil? ? event : event.get(id)
  end

  def self.events(attrs ={})
    event = client.event
    event.get_list attrs
  end

  def self.client(attrs = {})
    if !@client
      @client = Timepad::Client.new(attrs)
    end
    @client
  end

end
