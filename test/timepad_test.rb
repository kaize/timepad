require 'test_helper'

class TimepadTest < MiniTest::Unit::TestCase

  def setup
    Timepad.configure do |config|
      config.key  = 'api_key'
      config.id   = '7912'
    end
  end

  def test_should_get_client_instance
    client = Timepad.client
    assert_kind_of Timepad::Client, client
  end

  def test_should_get_mailist_instance
    maillist = Timepad.maillist
    assert_kind_of Timepad::Maillist, maillist
  end

  def test_should_get_mail_instance
    mail = Timepad.mail
    assert_kind_of Timepad::Mail, mail
  end

  def test_should_get_category_instance
    category = Timepad.category
    assert_kind_of Timepad::Category, category
  end

  def test_should_get_event_instance
    event = Timepad.event
    assert_kind_of Timepad::Event, event
  end

end
