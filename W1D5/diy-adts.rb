class Stack
  def initialize
    @stack = []
  end

  def push(*els)
    els.each { |el| @stack << el }
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(*els)
    els.each { |el| @queue << el }
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end

class Map
  def initialize
    @map = [[], []]
  end

  def keys
    map.first
  end

  def vals
    map.last
  end

  def[](key)
    get(key)
  end

  def[]=(key, val)
    set(key, val)
  end

  def set(key, val)
    index = keys.index(key)
    index ? vals[index] = val : update(key, val)
  end

  def get(key)
    vals[keys.index(key)]
  end

  def delete(key)
    index = keys.index(key)
    [keys, vals].each { |list| list.delete_at(index) } if index
  end

  private

  def update(key, val)
    keys << key
    vals << val
  end

  attr_accessor :map
end
