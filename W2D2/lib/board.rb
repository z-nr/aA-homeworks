require "byebug"
class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @name1 = name1
    @name2 = name2

    place_stones
  end

  def place_stones
    @cups[0..5] = Array.new(6) {[:stone]*4}
    @cups[7..12] = Array.new(6) {[:stone]*4}
  end

  def valid_move?(start_pos)
    unless (0..5) === start_pos || (7..12) === start_pos
      raise "Invalid starting cup"
    end
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start, player)
    holding = cups[start]
    @cups[start] = []

    until holding.empty?
      start = (start + 1) % 14
      cups[start] << holding.pop if not_my_store?(start, player)
    end

    render
    next_turn(start)
  end

  def not_my_store?(pos, current_player)
    return false if pos == 13 && current_player == @name1
    return false if pos == 6  && current_player == @name2
    true
  end

  def next_turn(end_idx)
    if end_idx == 6 || end_idx == 13
      :prompt
    elsif cups[end_idx].length == 1
      :switch
    else
      end_idx
    end
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    win_hash = {1 => name1, 0 => :draw, -1 => name2}

    win_hash[cups[6].length <=> cups[13].length]
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

end
