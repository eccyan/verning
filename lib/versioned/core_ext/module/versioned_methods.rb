class Module
  # Select a method that matches the conditions given with block.
  #
  #   versioned_method :foo, :feature_foo do 
  #     Time.now > "2013-04-01"
  #   end
  #
  def versioned_method(target, feature, key = nil)
    return if block_given? && yield

    alias_method_chain target, feature
  end
end
