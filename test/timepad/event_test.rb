require 'test_helper'

class Timepad::EventTest < MiniTest::Unit::TestCase

  def setup
    Timepad.configure do |config|
      config.key  = 'api_key'
      config.id   = '7912'
    end
  end

  def test_should_get_events
    stub_http_request(:get, "#{Timepad.endpoint}event_getlist")
      .with(:query => {:code => Timepad.key, :id => Timepad.id})
      .to_return(:body => '[]')
    Timepad::Event.get_list
  end

  def test_should_get_events_by_category
    category_id = 1
    stub_http_request(:get, "#{Timepad.endpoint}event_getlist")
      .with(:query => {:code => Timepad.key, :id => Timepad.id, :cat_id => category_id})
      .to_return(:body => '[]')
    Timepad::Event.get_list :cat_id => category_id
  end

  def test_shoul_get_event
    event_id = 1
    stub_http_request(:get, "#{Timepad.endpoint}event_get")
      .with(:query => {:code => Timepad.key, :id => Timepad.id, :e_id => event_id})
      .to_return(:body => '[]')
    Timepad::Event.get event_id
  end
end
