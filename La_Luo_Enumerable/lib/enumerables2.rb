require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  return arr.reduce(0, :+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  new_arr = long_strings.select {|s| s.include?(substring)}
  return new_arr == long_strings
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  new_arr = string.chars.select {|c| string.chars.count(c) > 1 }
  new_arr.delete(' ')
  new_arr.uniq!
  new_arr.sort!
  return new_arr
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  new_arr = string.split.sort_by {|word| word.length}
  return [new_arr[-1], new_arr[-2]]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  return ('a'..'z').to_a.select {|e| !string.include?(e)}
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  return (first_yr..last_yr).to_a.select { |y| y.to_s.chars.uniq == y.to_s.chars }
end

def not_repeat_year?(year)
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  new_arr = songs.select {|song| no_repeats?(song, songs)}
  return new_arr.uniq
end

def no_repeats?(song_name, songs)
  pre = songs.index(song_name)
  res = true
  cur = pre + 1
  (cur...songs.length).to_a.each do |i|
    if songs[i] == song_name
      if i == pre + 1
        res = false
        break
      end
      pre = i
    end
  end
  return res
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  if !string.include?('c')
    return ''
  end
  string.delete!('!')
  string.delete!('?')
  string.delete!(',')
  string.delete!('.')
  word_arr = string.split
  new_arr = word_arr.sort_by {|word| c_distance(word)}
  return new_arr[0]
end

def c_distance(word)
  if !word.include?('c')
    return 10000
  end
  word_arr = word.chars.reverse
  return word_arr.index('c')
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  ranges = []
  idx = 0
  arr.each do |e|
    if arr.count(e) > 1
      first, last = count_range(arr, e, idx)
      if first != last
        if first <= 1 || first > 1 && arr[first] != arr[first-1]
          ranges.push([first, last])
        end
      end
    end
    idx = idx + 1
  end
  return ranges.uniq
end

def count_range(array, ele, idx)
  first = array[idx...array.length].index(ele) + idx
  last = first
  (last...array.length).to_a.each do |i|
    if array[i] == ele
      last = i
    else
      break
    end
  end
  return [first, last]
end
