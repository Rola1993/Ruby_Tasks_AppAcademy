def add(x, y)
  x + y
end

def subtract(x, y)
  x - y
end

def sum(list)
  res = 0
  if list.length == 0
    res = 0
  else
    list.each do |i|
      res += i
    end
  end
  return res
end

def multiply(list)
  res = 1
  list.each do |i|
    res = res * i
  end
  return res
end

def power(x, y)
  res = 1
  y.times do
    res = res * x
  end
  return res
end

def factorial(n)
  res = 1
  if n > 0
    (1..n).each do |i|
      res = res * i
    end
  end
  return res
end
