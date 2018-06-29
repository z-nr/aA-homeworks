# LRUCache Class Document
class LRUCache
  attr_reader size

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
    count == size
  end
end
