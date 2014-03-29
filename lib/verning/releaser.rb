module Verning
  class Releaser
    def initialize(options = {})
      options.each do |key, value|
        key = key.to_s.gsub(/\.|\s|-|\/|\'/, '_').downcase.to_sym
        set_schedule(key, value)
      end
    end

    def set_schedule(name, release_conditions)
      Releaser.class_eval do
        define_method("#{name}_release_conditions", proc { release_conditions })
      end

      Releaser.class_eval do
        define_method("#{name}_releaseable?", proc do
          release_conditions = send("#{name}_release_conditions")

          # implementation date condition only for the time being
          start_date = release_conditions["date"]["start"].tap do |date|
            break date && Time.parse(date.to_s)
          end
          end_date = release_conditions["date"]["end"].tap do |date|
            break date && Time.parse(date.to_s)
          end

          if start_date.nil?
            Time.now <= end_date
          elsif end_date.nil?
            Time.now >= start_date
          else
            Time.now <= end_date && Time.now >= start_date
          end
        end)
      end
    end
  end
end
