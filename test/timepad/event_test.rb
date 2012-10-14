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

  def test_should_get_events_too
    request = stub_http_request(:get, "#{Timepad.endpoint}event_getlist")
        .with(:query => {:code => Timepad.key, :id => Timepad.id, :limit => 1, :order_by => 'begin'})
        .to_return(:body => '["test"]')

    result = Timepad.events :limit => 1, :order_by => :begin

    assert_requested(request)
    assert_equal result, ["test"]
  end

  def test_should_get_event
    request = stub_http_request(:get, "#{Timepad.endpoint}event_get")
        .with(:query => {:code => Timepad.key, :id => Timepad.id, :e_id => 1})
        .to_return(:body => '["test"]')
    result = Timepad.event 1

    assert_requested(request)
    assert_equal result, ["test"]
  end

  def test_should_get_event_to
    request = stub_http_request(:get, "#{Timepad.endpoint}event_get")
        .with(:query => {:code => Timepad.key, :id => Timepad.id, :e_id => 1})
        .to_return(:body => '["test"]')
    result = Timepad.event.get 1

    assert_requested(request)
    assert_equal result, ["test"]
  end

  def test_should_export_event_members
    request = stub_http_request(:get, "#{Timepad.endpoint}event_export")
        .with(:query => {:code => Timepad.key, :id => Timepad.id, :e_id => 1})
        .to_return(:body => '["test"]')
    result = Timepad.event.export 1

    assert_requested(request)
    assert_equal result, ["test"]
  end

  def test_should_export_event_member
    request = stub_http_request(:get, "#{Timepad.endpoint}event_export")
        .with(:query => {:code => Timepad.key, :id => Timepad.id, :e_id => 1, :r_id => 2})
        .to_return(:body => '["test"]')
    result = Timepad.event.export 1, :r_id => 2

    assert_requested(request)
    assert_equal result, ["test"]
  end

  def test_should_create_event
    request = stub_http_request(:get, "#{Timepad.endpoint}event_create")
        .with(:query => {:code => Timepad.key, :id => Timepad.id, :name => 'Name', :start_date => '2011-02-27'})
        .to_return(:body => '["test"]')
    result = Timepad.event.create :name => 'Name', :start_date => '2011-02-27'

    assert_requested(request)
    assert_equal result, ["test"]
  end

  def test_should_register_event_member
    request = stub_http_request(:get, "#{Timepad.endpoint}event_register")
        .with(:query => {:code => Timepad.key, :id => Timepad.id, :e_id => 1, :re_id => 2})
        .to_return(:body => '["test"]')
    result = Timepad.event.register :e_id => 1, :re_id => 2

    assert_requested(request)
    assert_equal result, ["test"]
  end
end
