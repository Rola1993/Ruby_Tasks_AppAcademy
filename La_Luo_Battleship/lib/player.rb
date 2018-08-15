class HumanPlayer
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def get_play
    puts "Please input a position to attack(row, col):"
    move = gets.chomp.split(",").map {|e| e.to_i}
    return move
  end

end
