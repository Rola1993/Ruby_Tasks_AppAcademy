def echo(words)
  return words
end

def shout(words)
  return words.upcase
end

def repeat(words, time = 2)
  new_words_list = []
  time.times do
    new_words_list.push(words)
  end
  return new_words_list.join(' ')
end

def start_of_word(word, index)
  return word[0...index]
end

def first_word(words)
  words_list = words.split
  return words_list[0]
end

def titleize(string)
  words_list = string.split(' ')
  not_cap = ['and', 'over', 'the']
  new_list = []
  idx = 0
  words_list.each do |e|
    if idx == 0 || not_cap.include?(e) != TRUE
      new_list.push(e.capitalize)
    else
      new_list.push(e)
    end
    idx += 1
  end
  return new_list.join(' ')
end
