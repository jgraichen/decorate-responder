module Responders
  module DecorateResponder
    def to_format
      @resource = decorate_resource(resource)
      super
    end

    def decorate_resource(res
      return controller.decorate(res) if controller.respond_to? :decorate
      return res.decorate if res.respond_to? :decorate
      res
    end
  end
end
