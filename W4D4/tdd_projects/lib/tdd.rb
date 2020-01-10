class Array

  def uniq
    # Solution 1
    hash = Hash.new(0)
    self.each do |el|
      hash[el] += 1
    end
    puts hash
    hash.keys

    # Solution 2
    # hash = Hash.new(false)
    # ans = []
    # self.each do |el|
    #   ans << el unless hash[el]
    #   hash[el] = true
    # end
    # ans
  end

  def two_sum

    # Solution 1
    #either a range or each with idx enumarator
    # arr = []
    # (0...length).each do |pair1|
    #   (pair1 + 1...length).each do |pair2|
    #     if self[pair1] + self[pair2] == 0
    #       arr << [pair1, pair2]
    #     end
    #   end
    # end
    # arr 

    # Solution
    # are the elements unique?
    # assume that they are
    # key = el, value = index # hash = {-1: 0, 0: 1, 2: 2, -2: 3, 1: 4}

    hash = Hash.new(false)
    ans = []
    self.each_with_index {|el, i| hash[el] = i}
    self.each_with_index do |el, i|
      ans << [i, hash[-el]] if hash[-el] && i != hash[-el]
      hash[el] = false
    end
    ans
  end
end


def my_transpose(matrix)
  # new_arr = Array.new(matrix.length) { Array.new(matrix.length) }
  # (0...matrix.length).each do |row|
  #   (0...matrix.length).each do |col|
  #     new_arr[col][row] =  matrix[row][col]
  #   end 
  # end
  # new_arr

  # can we modify input?
  (0...matrix.length).each do |i|
    (i + 1...matrix.length).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end
  matrix
end

def stock_pick(arr)
  largest = 0
  new_arr = []
  (0...arr.length).each do |i1|
    (i1 + 1...arr.length).each do |i2|
      if arr[i2] - arr[i1] > largest
        largest = arr[i2] - arr[i1]
        new_arr = [i1,i2]
      end
    end
  end
  new_arr
end

