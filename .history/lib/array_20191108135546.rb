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
    self.length.even? ? (self.sort[self.length/2] + self.sort[self.length/2]) / 2 : self.sort[self.length/2]
  end
end
