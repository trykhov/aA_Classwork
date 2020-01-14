require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    index = key.hash % num_buckets
    @store[index].include?(key)
  end

  def set(key, val)
    index = key.hash % num_buckets
    if !@store[index].include?(key)
      @store[index].append(key, val)
      @count += 1
    end
    @store[index].update(key, val)
  end

  def get(key)
    index = key.hash % num_buckets
    @store[index].get(key)
  end

  def delete(key)
    index = key.hash % num_buckets
    if @store[index].include?(key)
      @store[index].remove(key)
      @count -= 1
    end 
  end

  def each(&blk)
    
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
