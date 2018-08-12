class Array
  def my_select(&blk)
    result = []
    self.each do |e|
      if blk.call(e)
        result << e
      end
    end
    result
  end
end

class Array
  def my_map(&blk)
    result = []
    self.each do |e|
      result << blk.call(e)
    end
    result
  end
end


class Array
  def my_find(&blk)
    self.each do |e|
      if blk.call(e)
        return e
      end
    end
    nil
  end
end


class Array
  def my_any?(&blk)
    self.each do |e|
      return true if blk.call(e)
    end

    false
  end
end


class Array
  def my_all?(&blk)
    self.each do |e|
      return false if blk.call(e) == nil or !blk.call(e)
    end
    true
  end
end


class Array
  # Write an array method that returns `true` if the array has duplicated
  # values and `false` if it does not
  def dups?
    elements = Hash.new(false)
    self.each do |item|
      return true if elements[item]
      elements[item] = true
    end
    false
  end
end


class Hash

  # Hash#merge takes a proc that accepts three arguments: a key and the two
  # corresponding values in the hashes being merged. Hash#merge then sets that
  # key to the return value of the proc in a new hash. If no proc is given,
  # Hash#merge simply merges the two hashes.
  #
  # Write a method with the functionality of Hash#merge. Your Hash#my_merge method
  # should optionally take a proc as an argument and return a new hash. If a proc
  # is not given, your method should provide default merging behavior. Do not use
  # Hash#merge in your method.
  def my_merge(hash2, &b)
    if block_given?
      new_hash = {}
      self.each do |k, v|   # do a: and b: which has both old and new values.
        new_hash[k] = b.call(k, v, hash2[k]) if self.key?(k) && hash2.key?(k)
      end
      hash2.each_key do |e|  # do c:
        new_hash[e] = hash2[e] if !new_hash.key?(e)
      end
    else
      new_hash = self
      hash2.each do |k, v|
        new_hash[k] = v
      end
    end
    new_hash
  end
end
