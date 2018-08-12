class Dictionary
  # TODO: your code goes here!
  attr_accessor :entries, :keywords

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(pass)
    case pass
    when Hash
       @entries.merge!(pass)
       @keywords.push(pass.keys[0])
    when String
       @entries[pass] = nil
       @keywords.push(pass)
    end
    @keywords.sort!
  end

  def include?(key)
    return @keywords.include?(key)
  end

  def find(prefix)
    res = {}
    @keywords.each do |e|
      if e.include?(prefix)
          res[e] = @entries[e]
      end
    end
    return res
  end

  def printable
    printable = []
    @entries = @entries.sort_by { |k,v| k }
    @entries.each do |k,v|
      printable.push("[#{k}] \"#{v}\"")
    end

    return printable.join("\n")
  end
end
