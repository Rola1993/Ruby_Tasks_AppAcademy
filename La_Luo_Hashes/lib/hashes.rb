# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  res = {}
  str.split.each do |e|
    res[e] = e.length
  end
  return res
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  sort_pair = hash.sort_by {|k, v| v}
  return sort_pair[-1].first
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  new_hash = {}
  older.keys.each do |k|
    new_hash[k] = older[k]
  end
  newer.keys.each do |k|
    new_hash[k] = newer[k]
    if older.key?(k)
      older[k] = newer[k]
    end
  end
  return new_hash
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  res = Hash.new(0)
  word.chars.each do |c|
    res[c] += 1
  end
  return res
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  counts = Hash.new(0)
  res = []
  arr.each do |e|
    if !counts.key?(e)
      res.push(e)
    end
    counts[e] += 1
  end
  return res
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
   res = Hash.new(0)
   numbers.each do |n|
     if n.odd?
       res[:odd] += 1
     else
       res[:even] += 1
     end
   end
   return res
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are
# lower case.
def most_common_vowel(string)
  vowel_num = {'a'=>0, 'e'=>0, 'i'=>0, 'o'=>0, 'u'=>0}
  string.chars.each do |c|
    if vowel_num.key?(c)
      vowel_num[c] += 1
    end
  end
  freq_arr = vowel_num.sort_by {|k,v| v}
  most_freq = freq_arr.select {|t| t.last == freq_arr[-1].last}
  res_arr = most_freq.sort_by {|k,v| k}
  return res_arr[0].first
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  res =[]
  students.keys.each do |stu|
    if students[stu] > 6
      students.keys.each do |sec|
        if sec != stu && students[sec] > 6
          new_com = []
          new_com.push(stu)
          new_com.push(sec)
          new_com.sort!
          res.push(new_com)
        end
      end
    end
  end
  return res.uniq
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  num_spec = specimens.uniq.count
  spec_num = Hash.new(0)
  specimens.each do |e|
    spec_num[e] += 1
  end
  frequency_array = spec_num.sort_by {|k,v| v}
  res = num_spec ** 2 * frequency_array[0].last / frequency_array[-1].last
  return res
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  res = true
  normal_sign.delete!("'")
  normal_sign.downcase!
  vandalized_sign.downcase!
  letter_num = Hash.new(0)
  normal_sign.chars.each do |c|
    letter_num[c] += 1
  end
  vandalized_sign.chars.each do |e|
    if !letter_num.key?(e)
      res = false
    end
    letter_num[e] -= 1
    if letter_num[e] < 0
      res = false
    end
  end
   return res
end

def character_count(str)
end
