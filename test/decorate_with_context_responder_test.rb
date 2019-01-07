require 'test_helper.rb'

class DecorateWithContextResponderTest < ActionController::TestCase
  tests DecorateWithContextController

  def json
    JSON[@response.body]
  end

  def test_non_decoration
    DecorateWithContextController.resource = ['abc']

    get :index, format: :json

    assert_equal 1, json.size
    assert_equal 'abc', json[0]
  end

  def test_decoration_with_context
    DecorateWithContextController.resource = User.new(name: 'John')

    get :index, format: :json

    assert_equal 'UserDecorator', json['class']
    assert_equal 'bar', json['foo']
  end
end
