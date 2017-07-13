require 'test_helper.rb'

class ExplicitDecorateResponderTest < ActionController::TestCase
  tests ExplicitDecorateController

  def json
    JSON[@response.body]
  end

  def test_decoration
    ExplicitDecorateController.resource = User.new(name: 'John')

    get :index, format: :json

    assert_equal 'MyDecorator', json['class']
  end
end
