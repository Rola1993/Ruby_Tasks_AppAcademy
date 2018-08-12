def reverser
  string = yield
  words  = string.split()
  res = ''
  res = words.map!{|word| word.reverse}
  return res.join(' ')
end

def adder(num=1)
  return yield + num
end

def repeater(t = 1)
  t.times do
    yield
  end
end
