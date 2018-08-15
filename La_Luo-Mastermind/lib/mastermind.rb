class Code
  PEGS = {
    "B" => :blue,
    "G" => :green,
    "O" => :orange,
    "P" => :purple,
    "R" => :red,
    "Y" => :yellow,
  }

  attr_reader :pegs, :word

  def initialize(pegs)
    @pegs = pegs
  end

  def self.parse(string)
    pegs = []
    string.chars.each do |e|
      raise "It contains invalid color!" if !PEGS.has_key?(e.upcase)
      pegs << e.upcase
    end
    return Code.new(pegs)
  end

  def self.random
    pegs = ['B','G','O','P','R','Y'].sample(4)
    return Code.new(pegs)
  end

  def [](idx)
    return @pegs[idx]
  end

  def exact_matches(code_arr)
    match_num = 0
    (0..3).each do |idx|
      match_num += 1 if @pegs[idx] == code_arr[idx]
    end
    return match_num
  end

  def near_matches(code_arr)
    cur_pegs = @pegs.clone
    near_match_num = 0
    (0..3).each do |idx|
      color = code_arr[idx]
      if cur_pegs[idx] != color && cur_pegs.include?(color)
        near_match_num += 1
        first_occur_idx = cur_pegs.index(color)
        cur_pegs[first_occur_idx] = nil
      end
    end
    return near_match_num
  end

  def ==(object)
    return self.pegs == object.pegs if object.is_a?(Code)
    false
  end

end

class Game
  attr_reader :secret_code

  def initialize(code = Code.random)
      @secret_code = code
  end

  def get_guess
    puts "Please input your guess(4 color chars from ['B','G','O','P','R','Y']):"
    guess = gets.chomp
    raise "Invalid input!" if guess.length > 4
    return Code.parse(guess)
  end

  def display_matches(code)
    exact_match = @secret_code.exact_matches(code)
    near_match = @secret_code.near_matches(code)
    puts "Number of exact match: #{exact_match}"
    puts "Number of near match: #{near_match}"
  end

  def play
    win = 0
    10.times do |round|
      this_round = round + 1
      puts "Round #{this_round}"
      guess = get_guess
      if @secret_code == guess
        puts "You find the right color code!"
        win = 1
        break
      end
      display_matches(guess)
    end
    puts "You failed! The secret code is #{@secret_code.pegs}" if win == 0
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
