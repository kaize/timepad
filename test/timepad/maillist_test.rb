require 'test_helper'

class Timepad::MaillistTest < MiniTest::Unit::TestCase

  def setup
    Timepad.configure do |config|
      config.key  = 'api_key'
      config.id   = '7912'
    end
  end

  def test_should_get_maillists
    request = stub_http_request(:get, "#{Timepad.endpoint}maillist_getlist")
      .with(:query => {:code =>  Timepad.key, :id => Timepad.id})
      .to_return(:body => '["test"]')

    result = Timepad.maillist.get_list

    assert_requested(request)
    assert_equal result, ["test"]
  end

  def test_should_get_maillist
    request = stub_http_request(:get, "#{Timepad.endpoint}maillist_get")
      .with(:query => {:code =>  Timepad.key, :id => Timepad.id, :maillist => 'test'})
      .to_return(:body => '["test"]')

    result = Timepad.maillist.get 'test'

    assert_requested(request)
    assert_equal result, ["test"]
  end

  def test_should_add_subscribers
    request = stub_http_request(:get, "#{Timepad.endpoint}maillist_add_items")
      .with(:query => {:code =>  Timepad.key, :id => Timepad.id, :m_id => 'test', :i0_email => 'test@example.com'})
      .to_return(:body => '["test"]')

    result = Timepad.maillist.add_items 'test', [{:email => 'test@example.com'}]

    assert_requested(request)
    assert_equal result, ["test"]
  end

  def test_should_create_maillist
    request = stub_http_request(:get, "#{Timepad.endpoint}maillist_create")
      .with(:query => {:code =>  Timepad.key, :id => Timepad.id, :name => 'test', :i0_email => 'test@example.com'})
      .to_return(:body => '["test"]')

    result = Timepad.maillist.create 'test', [{:email => 'test@example.com'}]

    assert_requested(request)
    assert_equal result, ["test"]
  end



end
