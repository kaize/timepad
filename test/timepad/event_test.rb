require 'test_helper'

class Timepad::EventTest < MiniTest::Unit::TestCase

  def setup
    Timepad.configure do |config|
      config.key  = 'api_key'
      config.id   = '7912'
    end
  end

  def test_should_get_events
    request = stub_http_request(:get, "#{Timepad.endpoint}event_getlist")
      .with(:query => {:code => Timepad.key, :id => Timepad.id, :limit => 1, :order_by => 'begin'})
      .to_return(:body => '["test"]')

    result = Timepad.event.get_list :limit => 1, :order_by => :begin

    assert_requested(request)
    assert_equal result, ["test"]
  end

end
