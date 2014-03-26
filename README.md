Verning
=========
Versioning for methods, modules or classes

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

# License
Verning is released under the MIT license:

www.opensource.org/licenses/MIT
