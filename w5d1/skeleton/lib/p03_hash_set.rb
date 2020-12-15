class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      self[count] << key
      @count += 1
      resize! if @count == num_buckets
    end
  end

  def include?(key)
    @store.each { |bucket| return true if bucket.include?(key)}
    false
  end

  def remove(key)
    if include?(key)
      @store.each { |bucket| bucket.delete(key) if bucket.include?(key)}
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[count % num_buckets]
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
