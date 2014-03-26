Versioned 
=========
Versioning for methods, modules or classes

[![Build Status](https://travis-ci.org/eccyan/versioned.svg?branch=master)](https://travis-ci.org/eccyan/versioned)

## Install
```sh
gem install versioned
```

## Reference
### versioned_method
Select a method that matches the conditions given with block.
```ruby
require "versioned"

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
Versioned is released under the MIT license:

www.opensource.org/licenses/MIT
