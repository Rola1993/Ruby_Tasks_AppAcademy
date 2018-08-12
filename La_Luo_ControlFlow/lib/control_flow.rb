# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  lowercase = ('a'..'z').to_a
  new_str = ''
  str.chars.each do |ch|
    next if lowercase.include?(ch)
    new_str += ch
  end
  new_str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  if str.length % 2 == 0
    return str[str.length/2-1] + str[str.length/2]
  else
    return str[str.length/2]
  end
end

# Return the number of vowels in a string.
# VOWELS = %w(a e i o u)
def num_vowels(str)
  vowels = ['A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u']
  num = 0
  str.chars.each do |ch|
    if vowels.include?(ch)
      num += 1
    end
  end
  return num
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  product = 1
  (1..num).each do |i|
    product = product * i
  end
  return product
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  new_str = ''
  index = 1
  arr.each do |e|
    if index == arr.length
      new_str = new_str + e.to_s
      break
    end
    new_str = new_str + e.to_s + separator
    index += 1
  end
  return new_str
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  new_str = ''
  ch_arr = str.chars
  ch_arr.each_with_index do |ch, index|
    if index % 2 == 0
      new_str += ch.downcase
    else
      new_str += ch.upcase
    end
  end
  return new_str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  words = str.split
  new_words = []
  words.each do |w|
    if w.length >= 5
      new_words.push(w.reverse)
    else
      new_words.push(w)
    end
  end
  return new_words.join(' ')
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  res = []
  (1..n).each do |i|
    if i % 3 == 0 && i % 5 == 0
      res.push('fizzbuzz')
    elsif i % 3 == 0
      res.push('fizz')
    elsif i % 5 == 0
      res.push('buzz')
    else
      res.push(i)
    end
  end
  return res
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  return arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  if num == 1
    return FALSE
  end
  (2...num).each do |i|
    if num % i == 0
      return FALSE
    end
  end
  return TRUE
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  res = []
  (1..num).each do |i|
    if num % i == 0
      res.push(i)
    end
  end
  res.sort!
  return res
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  fac = factors(num)
  res = []
  fac.each do |i|
    if prime?(i) == TRUE
      res.push(i)
    end
  end
  return res
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  return prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  arr.sort!
  odd_num = 0
  odd = 0
  even_num = 0
  even = 0
  arr.each do |i|
    if i % 2 == 1
      odd_num += 1
      odd = i
    else
      even_num += 1
      even = i
    end
  end
  if even_num >= 2
    return odd
  else
    return even
  end
end
