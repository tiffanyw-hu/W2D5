class Fixnum

end

class Array
  def hash
    count = 0
    self.each_with_index do |el, idx|
      count += el.hash * (idx + 1).hash
    end
    count
  end
end

class String
  def hash
    count = 0
    self.each_byte.with_index do |el, idx|
      count += el.hash * (idx + 1).hash
    end
    count
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sorted_hash = self.sort.to_h
    sorted_hash.keys.hash + sorted_hash.values.hash
  end
end
