Verning
=========
Versioning for methods, modules or classes

[![Code Climate](https://codeclimate.com/github/eccyan/verning.png)](https://codeclimate.com/github/eccyan/verning)
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

## Releaser

Releaser release if the conditions are releaseable.
The conditions defined with YAML.

```yaml
super_pop_campaing:
  date:
    start: "2014-02-07"
    end: "2014-02-07"
```

Use this like :

```ruby
require "verning"

# Load releaser from yaml
Verning.releaser = YAML.file_load "releaser.yml"

class Klass
  def :foo; end
  def :foo_feature; end

  # set release name
  versioned_method :foo, :foo_feature, :super_pop_campaing
end
```

# License
Verning is released under the MIT license:

www.opensource.org/licenses/MIT
