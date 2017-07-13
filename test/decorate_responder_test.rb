require 'test_helper.rb'

class DecorateResponderTest < ActionController::TestCase
  tests AppController

  def json
    JSON[@response.body]
  end

  def test_non_decoration
    AppController.resource = ['abc']

    get :index, format: :json

    assert_equal 1, json.size
    assert_equal 'abc', json[0]
  end

  def test_decoration
    AppController.resource = User.new(name: 'John')

    get :index, format: :json

    assert_equal 'UserDecorator', json['class']
  end
end
