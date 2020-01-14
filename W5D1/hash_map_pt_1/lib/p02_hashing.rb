class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index {|el, i| sum += (el.hash + i.hash).hash}
    sum
  end
end

class String
  def hash
    utf_convert = self.split("").map {|char| char.ord}
    utf_convert.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each {|k, v| sum += (k.hash + v.hash).hash}
    sum
  end
end
