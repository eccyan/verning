
class Module
  # Select a method that matches the conditions given with block.
  #
  #   versioned_method :downed, :upped do 
  #     Time.now > "2013-04-01"
  #   end
  #
  # Select a method from release name
  #
  #   versioned_method :downed, :upped, :release_name
  #
  def versioned_method(downed, upped, release_name = nil)
    if block_given? 
      alias_method downed, upped if yield
    else
      alias_method downed, upped if Verning.releaser.send("#{release_name}_releaseable?")
    end
  end
end
