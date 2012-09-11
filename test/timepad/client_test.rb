require 'test_helper'

class Timepad::ClientTest < MiniTest::Unit::TestCase

  def setup
    Timepad.configure do |config|
      config.key  = 'api_key'
      config.id   = '7912'
    end
    @client = Timepad::Client.new
  end

  def test_should_get_client
    assert_kind_of Timepad::Client, @client
  end

  def test_should_get_maillist
    maillist = @client.maillist
    assert_kind_of Timepad::Maillist, maillist
  end

  def test_should_get_mail
    mail = @client.mail
    assert_kind_of Timepad::Mail, mail
  end

  def test_should_get_category
    category = @client.category
    assert_kind_of Timepad::Category, category
  end

  def test_should_get_event
    event = @client.event
    assert_kind_of Timepad::Event, event
  end

  def test_should_get_key
    key = @client.key
    assert_equal 'api_key', @client.key
  end

  def test_should_get_id
    key = @client.id
    assert_equal '7912', @client.id
  end
end
