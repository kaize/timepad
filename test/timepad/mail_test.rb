require 'test_helper'

class Timepad::MaillistTest < MiniTest::Unit::TestCase

  def setup
    Timepad.configure do |config|
      config.key  = 'api_key'
      config.id   = '7912'
    end
  end

  def test_should_create_mail
    request = stub_request(:get, "http://timepad.ru/api/mail_create?a0=a@a.a&a1=b@b.b&code=api_key&id=7912&m0=1&m1=2&name=subject&text=text").to_return(:body => '["test"]')
    result = Timepad.mail.create :subject => 'subject', :text => 'text', :maillists => [1,2], :subscribers => ['a@a.a', 'b@b.b']

    assert_requested(request)
    assert_equal result, ["test"]
  end

end
