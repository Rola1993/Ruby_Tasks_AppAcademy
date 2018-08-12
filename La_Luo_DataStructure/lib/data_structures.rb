# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  # your code goes here
  r = arr.max - arr.min
  return r
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  # your code goes here
  return arr == arr.sort
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  # your code goes here
  num = str.chars.count{|v| ['A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u'].include? v}
  return num
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  # your code goes here
  char_arr = str.chars
  res_arr = char_arr - ['A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u']
  res = res_arr.join
  return res
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  # your code goes here
  char_arr = int.to_s.chars
  res = char_arr.sort.reverse
  return res
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  # your code goes here
  char_arr = str.downcase.chars
  uniq_arr = char_arr.uniq
  return char_arr.length != uniq_arr.length
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  # your code goes here
  new_arr = ['(' ] + arr[0..2] + [') '] + arr[3..5] + ["-"] + arr[6..9]
  return new_arr.join
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  # your code goes here
  str_arr = str.split(',')
  int_arr = str_arr.map(&:to_i)
  res = int_arr.max - int_arr.min
  return res
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  # your code goes here
  if offset == 1
    e = arr.shift
    arr.push(e)
  elsif offset > arr.length
    e = arr.take(arr.length-1)
    arr = arr.drop(arr.length-1)
    arr = arr + e
  elsif offset > 0
    e = arr.take(offset)
    arr = arr.drop(offset)
    arr = arr + e
  else
    index = offset % arr.length
    e = arr.take(index)
    arr = arr.drop(index)
    arr = arr + e
  return arr
end
end
