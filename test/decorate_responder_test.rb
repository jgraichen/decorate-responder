require 'test_helper.rb'

class DecorateResponderTest < ActionController::TestCase
  tests AppController

  def json; JSON[@response.body] end

  def test_non_decoration
    get :index, :format => :json, :resource => [ "abc" ]

    assert_equal 1, json.size
    assert_equal "abc", json[0]
  end

  def test_decoration
    get :index, :format => :json, :resource => User.new(:name => "John")

    assert_equal "UserDecorator", json["class"]
  end
end
