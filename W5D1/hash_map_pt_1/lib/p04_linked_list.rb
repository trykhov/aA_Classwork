require "byebug"
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    prev_node = self.prev
    next_node = self.next
    prev_node.next = next_node
    next_node.prev = prev_node
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
     @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @tail.prev == @head
  end

  def get(key)
    curr_node = @head.next
    until curr_node == @tail
      return curr_node.val if curr_node.key == key
      curr_node = curr_node.next
    end
    nil
  end

  def include?(key)
    curr_node = @head.next
    until curr_node == @tail
      return true if curr_node.key == key
      curr_node = curr_node.next
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    prev_last = last
    @tail.prev = new_node
    prev_last.next = new_node
    new_node.next = @tail
    new_node.prev = prev_last
  end

  def update(key, val)
    return false unless self.include?(key)
    curr_node = @head.next
    until curr_node.key == key
      curr_node = curr_node.next
    end
    curr_node.val = val
  end

  def remove(key)
    return false unless self.include?(key)
    curr_node = @head.next
    until curr_node.key == key
      curr_node = curr_node.next
    end
    prev_node = curr_node.prev
    next_node = curr_node.next
    prev_node.next = next_node
    next_node.prev = prev_node
  end

  def each(&blk)
    blk ||= proc {|node| node}
    curr_node = @head.next
    until curr_node == @tail
      blk.call(curr_node)
      curr_node = curr_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
