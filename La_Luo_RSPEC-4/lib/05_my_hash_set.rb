class MyHashSet
  # TODO: your code goes here!
  attr_accessor :store

  def initialize
    @store = {}
  end

  def insert(key)
    @store[key] = true
  end

  def include?(key)
    @store.key?(key) && @store[key] == true
  end

  def to_a
    array = [ ]
    @store.each_key do |k|
      array << k
    end
    return array
  end

  def delete(key)
    @store[key] = false
  end

  def union(second)
    new_set = MyHashSet.new()
    @store.each_key do |e|
      new_set.insert(e)
    end
    second.to_a.each do |e|  # @store is a Hash object but set2 is a MyHashSet object
      if !new_set.include?(e)
        new_set.insert(e)
      end
    end
    return new_set
  end

  def intersect(second)
    new_set = MyHashSet.new()
    second.to_a.each do |e|
      if @store.include?(e)
        new_set.insert(e)
      end
    end
    return new_set
  end

  def minus(set2)
    new_set = MyHashSet.new()
    @store.each_key do |e|
      if !set2.include?(e)
        new_set.insert(e)
      end
    end
    return new_set
  end

end
