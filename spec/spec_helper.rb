require 'bundler/setup'
Bundler.setup

require 'pry'
require 'active_support'
require 'active_support/core_ext'

require 'verning'
include Verning

require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
end
