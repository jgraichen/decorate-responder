require 'minitest/autorun'
require 'bundler'

Bundler.setup

# Configure Rails
ENV["RAILS_ENV"] = "test"

require 'active_support'
require 'action_controller'
require 'draper'

require 'decorate-responder'

Responders::Routes = ActionDispatch::Routing::RouteSet.new
Responders::Routes.draw do
  match '/index' => 'app#index'
  match '/ex' => 'explicit_decorate#index'
end

class ActiveSupport::TestCase
  setup do @routes = Responders::Routes end
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

  def as_json(options)
    { :class => "UserDecorator" }
  end
end

class MyDecorator < Draper::Decorator
  def as_json(options)
    { :class => "MyDecorator" }
  end
end

class AppController < ActionController::Base
  include Responders::Routes.url_helpers

  self.responder = AppResponder
  respond_to :json

  def index
    respond_with params[:resource]
  end
end

class ExplicitDecorateController < ActionController::Base
  include Responders::Routes.url_helpers

  self.responder = AppResponder
  respond_to :json

  def index
    respond_with params[:resource]
  end

  def decorate(resource)
    MyDecorator.new(resource)
  end
end
