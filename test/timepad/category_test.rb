require 'test_helper'

class Timepad::CategoryTest < MiniTest::Unit::TestCase

  def setup
    Timepad.configure do |config|
      config.key  = 'api_key'
      config.id   = '7912'
    end
  end

  def test_should_get_categories
    stub_http_request(:get, "#{Timepad.endpoint}category_getlist")
      .with(:query => {:code =>  Timepad.key, :id => Timepad.id})
      .to_return(:body => '[]')
    Timepad::Category.get_list
  end
end
