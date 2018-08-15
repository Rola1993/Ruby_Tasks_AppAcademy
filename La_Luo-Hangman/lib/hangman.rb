class Hangman
  attr_reader :guesser, :referee, :board, :ans

  def initialize(options)
    @guesser = options[:guesser]
    @referee = options[:referee]
  end

  def setup
    word_len = @referee.pick_secret_word
    @guesser.register_secret_length(word_len)
    @board = Array.new(word_len)
  end

  def update_board(indices, guess_letter)
    indices.each do |i|
      @board[i] = guess_letter
    end
  end

  def take_turn
    guess_letter = @guesser.guess(@board)
    indices = @referee.check_guess(guess_letter)
    update_board(indices, guess_letter)
    @guesser.handle_response(guess_letter, indices)
  end

  def play
    setup
    while @board.include?(nil)
      take_turn
    end

    puts "Secret word is figured out!"
  end

end

class HumanPlayer
  attr_reader :word

  def pick_secret_word
    puts "Please input your secret word:"
    @word = gets.chomp
    return @word.length
  end

  def register_secret_length(word_len)
    puts "The length of the secret word is #{word_len}"
  end

  def guess(board)
    puts "The secret word is now: #{board}"
    puts "Please input your guess:"
    return gets.chomp
  end

  def check_guess(letter)
    puts "Guesser guessed #{letter}, please inform the positions it occurs:"
    indices = get.chomp.split(",").map {|e| e.to_i}
    return indices
  end

  def handle_response(guess_letter, indices)
    puts "#{guess_letter} found in #{indices}!"
  end

end

class ComputerPlayer
  attr_reader :dictionary, :word, :candidate_words

  def initialize(dictionary)

    @dictionary = dictionary
    @candidate_words = dictionary
    @guessed = []
  end

  def guess(board)
    # handle_response would delete those words which doesn't have guessed letter
    # or have guessed letters in incorrect position
    # so we don't need to care about incorrect guessed letters
    letter_freq = letter_frequency(board).sort_by {|k,v| v}
    return letter_freq.last.first
  end

  def letter_frequency(board)
    char_freq = Hash.new(0)
    @candidate_words.each do |word|
      board.each_with_index do |letter, index|
        char_freq[word[index]] += 1 if letter.nil?
      end
    end
    return char_freq
  end

  def handle_response(guess_letter, indices)

    if indices == []
      @candidate_words.reject! {|word| word.include?(guess_letter)}
    else  # check if the indices of guess letter in this word is equal to indices passed in
      indices.sort!
      @candidate_words.each do |word|
          this_indices = (0...word.length).find_all { |i| word[i] == guess_letter }
          this_indices.sort!
          @candidate_words.delete(word) if this_indices != indices
      end
    end

  end

  def pick_secret_word
    idx = rand(@dictionary.length)
    @word = @dictionary[idx]
    return @word.length
  end

  def check_guess(letter)
    indices = []
    if !@word.include?(letter)
      return indices
    else
      indices = (0...@word.length).find_all { |i| @word[i] == letter }
      return indices
    end
  end

  def register_secret_length(word_len)
    @candidate_words = @dictionary.select { |word| word.length == word_len }
    puts "The length of the secret word is #{word_len}"
  end

end

if __FILE__ == $PROGRAM_NAME
  dictionary = {}
  dictionary  = IO.readlines("lib/dictionary.txt").map(&:chomp)
  puts "Welcome to Hangman! Who is the guesser? Input 'C' as Computer, 'M' as Me!"
  if gets.chomp == 'C'
    guesser = ComputerPlayer.new(dictionary)
    referee = HumanPlayer.new()
  elsif gets.chomp == 'M'
    referee = ComputerPlayer.new(dictionary)
    guesser = HumanPlayer.new()
  else
    "Invalid Input!"
  end

  Hangman.new({guesser: guesser, referee: referee}).play
end
