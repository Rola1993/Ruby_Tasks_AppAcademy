# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.

def guessing_game
  ans = Random.new.rand(1..100)
  num = 0

  while true
    puts "Please guess a number:"
    input = gets.chomp.to_i
    num += 1
    if input < ans
      puts "You guessed #{input}. It was too low!"
    elsif  input > ans
      puts "You guessed #{input}. It was too high!"
    else
      puts "You have guessed the #{ans} succesffully! You have guessed #{num} times."
      break
    end
  end

end
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def file_shuffler
  puts "Please input a filename to shuffle:"
  file_path = gets.chomp
  filename = File.basename(file_path, ".*")
  shuffle_file_name = "#{filename}-shuffle.txt"
  shuffled_contents = File.readlines(file_path).sort_by { rand }
  File.open(shuffle_file_name, "w") do |f|
    shuffled_contents.each do |line|
      f.puts line.chomp
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  file_shuffler
end
