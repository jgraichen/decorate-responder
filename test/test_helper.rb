require 'minitest/autorun'
require 'bundler'

# Configure Rails
ENV['RAILS_ENV'] = 'test'

Bundler.require

require 'action_dispatch'

require 'responders'
require 'decorate-responder'

Responders::Routes = ActionDispatch::Routing::RouteSet.new
Responders::Routes.draw do
  get '/index' => 'app#index'
  get '/ex' => 'explicit_decorate#index'
end

class ActiveSupport::TestCase
  setup { @routes = Responders::Routes }
end

class AppResponder < ActionController::Responder
  include Responders::DecorateResponder
end

class User
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def decorate
    UserDecorator.new self
  end
end

class UserDecorator < Draper::Decorator
  decorates User

  def as_json(_options)
    { class: 'UserDecorator' }
  end
end

class MyDecorator < Draper::Decorator
  def as_json(_options)
    { class: 'MyDecorator' }
  end
end

class AppController < ActionController::Base
  include Responders::Routes.url_helpers

  cattr_accessor :resource

  self.responder = AppResponder
  respond_to :json

  def index
    respond_with self.class.resource
  end
end

class ExplicitDecorateController < ActionController::Base
  include Responders::Routes.url_helpers

  cattr_accessor :resource

  self.responder = AppResponder
  respond_to :json

  def index
    respond_with self.class.resource
  end

  def decorate(resource)
    MyDecorator.new(resource)
  end
end
