
class Module
  # Select a method that matches the conditions given with block.
  #
  #   versioned_method :downed, :upped do 
  #     Time.now > "2013-04-01"
  #   end
  #
  def versioned_method(downed, upped, key = nil)
    return if block_given? && yield.!

    alias_method downed, upped
  end
end
