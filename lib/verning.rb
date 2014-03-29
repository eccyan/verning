require "verning/version"
require "verning/core_ext"
require "verning/releaser"

module Verning
  def self.releaser=(options = {})
    @releaser = Releaser.new(options)
  end

  def self.releaser
    @releaser
  end
end
