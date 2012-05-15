require 'test_helper'
require 'webmock/minitest'

class Timepad::MaillistTest < MiniTest::Unit::TestCase

  def setup
    Timepad.configure do |config|
      config.key  = 'api_key'
      config.id   = '7912'
    end
  end

  def test_should_get_mailists
    stub_http_request(:get, "#{Timepad.endpoint}maillist_getlist").with(:query => {:code=> Timepad.key, :id => Timepad.id}).to_return(:body=>'[]')
    Timepad::Maillist.get_list
  end
end
