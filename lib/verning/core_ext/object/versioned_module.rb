
class Object
  # Select a module that matches the conditions given with block.
  #
  #   versioned_module :downed, :upped do 
  #     Time.now > "2013-04-01"
  #   end
  #
  # Select a method from release name
  #
  #   versioned_module :downed, :upped, :release_name
  #
  def versioned_module(downed, upped, release_name = nil)
    if block_given? 
      if yield
        Object.send :remove_const, downed.to_s
        const_set downed.to_s, Object.const_get(upped.to_s)
      end
    else
      if Verning.releaser.send("#{release_name}_releaseable?")
        Object.send :remove_const, downed.to_s
        const_set downed.to_s, Object.const_get(upped.to_s)
      end
    end
  end

  def versioned_class(downed, upped, release_name = nil, &block)
    versioned_module(downed, upped, release_name, &block)
  end
end
