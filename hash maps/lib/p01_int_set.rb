require 'byebug'

class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max) { false }
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @max)
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
    num
  end

  def remove(num)
    self[num].delete(num)
    @store
  end

  def include?(num)
    self[num].each do |number|
      return true if number == num
    end
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == num_buckets
    unless self[num].include?(num)
      self[num] << num
      @count += 1
    end
    num
  end

  def remove(num)
    @count -= 1 if self[num].include?(num)
    self[num].delete(num)
    @store
  end

  def include?(num)
    self[num].each do |number|
      return true if number == num
    end
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # byebug
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.each do |bucket|
      bucket.each do |number|
        self.insert(number)
      end
    end
  end
end
