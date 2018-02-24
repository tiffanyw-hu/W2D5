require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    unless include?(key)
      self[key] << key
      @count += 1
    end

    key
  end

  def include?(key)
    self[key].each do |el|
      return true if key == el
    end

    false
  end

  def remove(key)
    @count -= 1 if include?(key)
    self[key].delete(key)
    @store
  end

  private

  def [](num)
    new_index = num.hash % num_buckets
    @store[new_index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0

    old_store.each do |bucket|
      bucket.each do |key|
        self.insert(key)
      end
    end
  end
end
