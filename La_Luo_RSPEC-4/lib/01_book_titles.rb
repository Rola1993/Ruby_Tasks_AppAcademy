class Book
  # TODO: your code goes here!
  attr_reader :title

  def title=t
  	small_words = %w[a an and of in the]
  	words = t.split(" ")

  	words.map do |word|
  		word.capitalize! unless small_words.include?(word)
  	end

  	words[0].capitalize!
  	@title = words.join(" ")
  end
end
