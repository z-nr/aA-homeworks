class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(element)
    return update element if existing? element

    make_space if full?
    @cache << element
  end

  def show
    p @cache
    nil
  end

  private

  def update(element)
    @cache.delete(element)
    @cache << element
    element
  end

  def make_space
    @cache.shift
  end

  def existing?(element)
    @cache.include? element
  end

  def full?
    count == @size
  end
end

# Quick Testing

johnny_cache = LRUCache.new(4)

johnny_cache.add('I walk the line')
johnny_cache.add(5)

p johnny_cache.count == 2

johnny_cache.add([1, 2, 3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add(a: 1, b: 2, c: 3)
johnny_cache.add([1, 2, 3, 4])
johnny_cache.add('I walk the line')
johnny_cache.add(:ring_of_fire)
johnny_cache.add('I walk the line')
johnny_cache.add(a: 1, b: 2, c: 3)

puts 'Actual:'
johnny_cache.show
puts 'Expected:'
p [[1, 2, 3, 4], :ring_of_fire, 'I walk the line', { a: 1, b: 2, c: 3 }]
