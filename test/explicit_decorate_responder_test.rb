require 'test_helper.rb'

class ExplicitDecorateResponderTest < ActionController::TestCase
  tests ExplicitDecorateController

  def json; JSON[@response.body] end

  def test_decoration
    get :index, :format => :json, :resource => User.new(:name => "John")

    assert_equal "MyDecorator", json["class"]
  end
end
