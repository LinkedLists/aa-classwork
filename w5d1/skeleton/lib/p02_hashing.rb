class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    num = self.join("").to_i
    num = num.to_s(2)
    num.to_i
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
