class Temperature
  # TODO: your code goes here!
    def initialize(options = {})
      @options = options
    end

    def in_fahrenheit
      if @options.key?(:f)
        return @options[:f]
      else
        return (@options[:c] * 9.0 / 5) + 32
      end
    end

    def in_celsius
      if @options.key?(:c)
        return @options[:c]
      else
        return (@options[:f] - 32) * 5.0 / 9
      end
    end

    def self.from_fahrenheit(num)
        self.new(:f => num)
    end

    def self.from_celsius(num)
        self.new(:c => num)
    end
end

# Subclasses/Inheritance
class Celsius < Temperature
  def initialize(num, options = {})
    @options = options
    @options[:c] = num
  end

  def in_fahrenheit
      super
  end

  def in_celsius
      super
  end
end

class Fahrenheit < Temperature
  def initialize(num, options = {})
      @options = options
      @options[:f] = num
  end

  def in_fahrenheit
      super
  end

  def in_celsius
      super
  end
end
