# Decorate::Responder [![Build Status](https://travis-ci.org/jgraichen/decorate-responder.png?branch=master)](https://travis-ci.org/jgraichen/decorate-responder)

A Rails responder that will apply a decorator to a resource in the responder chain.

## Installation

Add this line to your application's Gemfile:

    gem 'decorate-responder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install decorate-responder

You will also need a decorator gem like [draper](https://github.com/drapergem/draper) or your own decorator implementation.

## Usage

Add `Responders::DecorateResponder` to your responder chain:

```ruby
class AppResponder < Responder
  include Responders::DecorateResponder
end

class MyController < ApplicationController
  self.responder = AppResponder
end
```

Or use it with [plataformatec/responders](https://github.com/plataformatec/responders):

```ruby
class MyController < ApplicationController
  responders Responders::DecorateResponder
end
```

If you're using a decorator gem such as [draper](https://github.com/drapergem/draper) that injects a `decorate` method into your resources they will get decorated automatically.

When using draper, you may want to pass a [context hash](https://github.com/drapergem/draper#adding-context) from the controller to the decorator.
You can provide this context by adding a (public!) `decoration_context` method to the controller:

```ruby
class AppController
  responders Responder::DecorateResponder
  
  def decoration_context
    { color: false }
  end
end
```

If you want to build even more advanced decoration logic, you can also explicitly decorate your resources by adding a `decorate` method to your controller:

```ruby
class AppController
  responders Responders::DecorateResponder

  def decorate(resource)
  	MyDecorator.new resource
  end
end
```

If the resource and controller do not have a `decorate` method the resource will not be decorated.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for your feature.
4. Add your feature.
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request

## License

[MIT License](http://www.opensource.org/licenses/mit-license.php)

Copyright (c) 2013, Jan Graichen
