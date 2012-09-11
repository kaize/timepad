require 'test_helper'

class Timepad::BaseTest < MiniTest::Unit::TestCase

  def setup
    Timepad.configure do |config|
      config.key  = 'api_key'
      config.id   = '7912'
    end
    @client = Timepad::Client.new
    @base = Timepad::Base.new
    @base.instance_variable_set(:@client,@client)
  end

  def test_should_make_query
    query = @base.make_query :a => 'b', :c => 'd'

    assert_equal 'a=b&c=d', query
  end

  def test_should_make_query_without_nil_value
    query = @base.make_query :a => nil, :c => 'd'

    assert_equal '&c=d', query
  end

  def test_should_make_request
    request = stub_http_request(:get, "#{Timepad.endpoint}base_action")
      .with(:query => {:code =>  Timepad.key, :id => Timepad.id, :param => 'value' })
      .to_return(:body => '["test"]')

    @base.request 'action', :param => 'value'

    assert_requested(request)
  end


end
