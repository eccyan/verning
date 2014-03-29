Verning
=========
Versioning for methods, modules or classes

[![Coverage Status](https://coveralls.io/repos/eccyan/verning/badge.png)](https://coveralls.io/r/eccyan/verning)
[![Build Status](https://travis-ci.org/eccyan/verning.svg?branch=master)](https://travis-ci.org/eccyan/verning)

## Install
```sh
gem install verning
```

## Reference
### versioned_method
Select a method that matches the conditions given with block.
```ruby
require "verning"

class Klass
  RELEASE_DATE = Date.parse("2014-3-26")
  
  def foo
    :foo
  end
  
  def foo_fearture
    :foo_feature
  end
  
  versioned_method :foo, :foo_feature do 
    Date.today >= RELEASE_DATE 
  end
end
```

### versioned_module/versioned_class
Select a module/class that matches the conditions given with block.
```ruby
require "verning"

RELEASE_DATE = Date.parse("2014-3-26")

class Foo; end
class FooFeature; end

versioned_module Foo, FooFeature do
  Date.today >= RELEASE_DATE
end
```

# License
Verning is released under the MIT license:

www.opensource.org/licenses/MIT
