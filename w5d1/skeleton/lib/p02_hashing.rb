require "byebug"

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
    alpha = ('a'..'z').to_a
    sum = ""
    self.each_char do |char|
      # debugger
      num = alpha.index(char.downcase)
      num2 = num.to_s(2)
      sum += num2
    end
    sum.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    values = self.values.sort

    alpha = ('a'..'z').to_a
    sum = ""
    values.each do |char|
      # debugger
      if alpha.include?(char)
        num = alpha.index(char.downcase)
        num2 = num.to_s(2)
        sum += num2
      else
        sum += char.to_s(2)
      end
    end
    sum.to_i

  end
end
