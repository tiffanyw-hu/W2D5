class Node
  attr_accessor :key, :val, :next, :prev

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
    @prev.next = @next
    @next.prev = @prev
    @next, @prev = nil, nil
  end
end

class LinkedList
  def initialize
    @head = Node.new(:head, nil)
    @tail = Node.new(:tail, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.next = @tail
    @tail.prev = @head
  end

  def get(key)
    self.each do |node|
      return node.value if node.key == key
    end

    nil
  end

  def include?(key)
  end

  def append(key, val)
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
