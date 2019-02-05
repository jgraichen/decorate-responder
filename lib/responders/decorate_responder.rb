module Responders
  module DecorateResponder
    def respond
      @resource = decorate_resource(resource)
      super
    end

    def decorate_resource(res)
      return controller.decorate(res) if controller.respond_to? :decorate

      if res.respond_to? :decorate
        if controller.respond_to? :decoration_context
          return res.decorate context: controller.decoration_context
        else
          return res.decorate
        end
      end

      res
    end
  end
end
