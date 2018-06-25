class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    clear
    puts "Repeat after me!"
    wait

    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    clear
    show_sequence

    require_sequence
    @sequence_length += 1

    round_success_message unless game_over
  end

  def show_sequence
    clear
    add_random_color

    seq.each do |color|
      puts color
      wait(0.2)
    end

    wait(1)
    clear
  end

  def require_sequence
    sequence_length.times do |index|
      unless gets.chomp == seq[index]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    clear
    puts "Nice!"
    wait
  end

  def game_over_message
    puts "Not Nice!", "Game Over: Level #{sequence_length}"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
  
  def clear
    system('clear')
  end

  def wait(seconds = 2)
    sleep(seconds)
  end
end
