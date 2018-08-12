def translate(string)
  words = string.split
  new_words_list = []
  words.each do |e|
    new_word = translate_one(e)
    new_words_list.push(new_word)
  end
  return new_words_list.join(' ')
end

def translate_one(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  idx = 0
  new_word = ''
  if vowels.include?(word[0])
    new_word = word + 'ay'
  elsif word.index('qu') == 0 || word.index('qu') == 1
    idx = word.index('qu') + 2
    new_word = word[idx...word.length] + word[0...idx] + 'ay'
  else
    word.chars.each do |e|
      if !vowels.include?(e)
        idx += 1
      else
        break
      end
    end
    new_word = word[idx...word.length] + word[0...idx] + 'ay'
  end
  return new_word
end
