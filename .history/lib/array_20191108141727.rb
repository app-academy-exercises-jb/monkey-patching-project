# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.max - self.min
  end

  def average
    return nil if self.length == 0
    self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.length == 0
    self.length.even? ? (self.sort[self.length/2] + self.sort[self.length/2 - 1]) / 2.0 : self.sort[self.length/2]
  end

  def counts
    count = Hash.new(0)
    self.each { |e| count[e] += 1 }
    count
  end

  def my_count(value)
    count = 0
    self.each { |e| count += 1 if value == e }
    count
  end

  def my_index(value)
    index = nil
    self.each_with_index { |ele, idx| 
        if ele == value
            index = idx
            break
        end
    }
    index
  end

  def my_uniq
    new_arr = []
    self.each { |ele| 
        new_arr << ele unless new_arr.include?(ele)
    }
    new_arr
  end

  def my_transpose
    new_arr = Array.new(self.length)
    self.each_with_index { |ele, idx|
        new_arr[idx] << ele
    }
    new_arr
  end
end
