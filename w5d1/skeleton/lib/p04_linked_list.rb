require "byebug"

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @tail.prev = @head
    @head.next = @tail
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @tail.prev == @head && @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    last_node = @tail.prev
    new_node = Node.new(key, val)
    last_node.next = new_node
    new_node.prev = last_node
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    values = []
    current_node = first
    until current_node == @tail
      # debugger
      # values << current_node.val #if current_node != @head && current_node != @tail
      yield current_node
      current_node = current_node.next
    end
    # debugger
    # values
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
