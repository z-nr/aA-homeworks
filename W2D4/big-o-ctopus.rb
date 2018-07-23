# O(n^2) -- double iteration
def sluggish_octopus(fish_array)
  fish_array.find do |f1|
    fish_array.all? { |f2| f1.length >= f2.length }
  end
end

# O(nlog(n)) -- iterative merge sort
def dominant_octopus(fish_array)
  sorted = fish_array.map { |fish| [fish] }

  sorted << merge(sorted.shift, sorted.shift) until sorted.one?

  sorted.pop.pop
end

def merge(left, right)
  merged = []

  until left.empty? || right.empty?
    merged <<
      if left.first.length < right.first.length
        left.shift
      else
        right.shift
      end
  end

  merged.concat(left, right)
end

# O(n) -- keeps track of longest fish
def clever_octopus(fish_array)
  longest_fish = fish_array.first
  fish_array.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

# Dancing Octopus

def slow_dance(dir, tiles)
  tiles.index(dir)
end

def fast_dance(dir, tiles)
  tiles[dir]
end


# Cheap Testing
fish = [
  'fish', 'fiiish', 'fiiiiish', 'fiiiish',
  'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p sluggish_octopus(fish) == fish.last
p dominant_octopus(fish) == fish.last
p clever_octopus(fish) == fish.last

tiles = ["up", "right-up", "right", "right-down",
  "down", "left-down", "left",  "left-up" ]

tiles_hash = tiles.zip((0..7).to_a).to_h

p slow_dance("up", tiles) == 0
p slow_dance("right-down", tiles) == 3
p fast_dance("up", tiles_hash) == 0
p fast_dance("right-down", tiles_hash) == 3