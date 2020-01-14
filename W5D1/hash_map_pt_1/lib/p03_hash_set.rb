class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count >= num_buckets
    if !self[key].include?(key)
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    self[key].any? { |el| el == key}
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](key)
    index = key.hash % @store.length
    @store[index]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |ele|
        index = ele.hash % new_arr.length
        new_arr[index] << ele
      end
    end
    @store = new_arr
  end
end
