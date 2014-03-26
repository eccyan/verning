
class Object
  # Select a module that matches the conditions given with block.
  #
  #   versioned_module :downed, :upped do 
  #     Time.now > "2013-04-01"
  #   end
  #
  def versioned_module(downed, upped, key = nil)
    return if block_given? && yield.!

    Object.send :remove_const, downed.to_s
    const_set downed.to_s, Object.const_get(upped.to_s)
  end

  # Select a class that matches the conditions given with block.
  #
  #   versioned_module :downed, :upped do 
  #     Time.now > "2013-04-01"
  #   end
  #
  def versioned_class(downed, upped, key = nil, &block)
    versioned_module(downed, upped, key, &block)
  end
end
