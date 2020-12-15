class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)

  end

  def include?(key)
  end

  def remove(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = []
    @store.each { |sub| arr += sub }
    prev_num_buckets = num_buckets
    @store = Array.new(prev_num_buckets * 2) {Array.new}
    @count = 0
    arr.each { |ele| insert(ele)}
  end
end
