
class Fixnum
  def in_words
    return 'zero' if self == 0
    num = self
    return helper(num).strip
  end

  def helper(num)
    underTen = ["", "one", "two", "three", "four", "five", "six", "seven",
       "eight", "nine"]

    underTwenty = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
      "sixteen", "seventeen", "eighteen", "nineteen"]

    underHundred = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty",
      "seventy", "eighty", "ninety"]

    if num < 10
      return underTen[num]
    elsif num < 20
      return underTwenty[num - 10]
    elsif num < 100
      return underHundred[num/10] + ' ' + helper(num%10)
    elsif num < 1000
      return helper(num/100).strip + " hundred " + helper(num%100)
    elsif num < 1000000
      return helper(num/1000).strip + " thousand " + helper(num%1000)
    elsif num < 1000000000
      return helper(num/1000000).strip + " million " + helper(num%1000000)
    elsif num < 1000000000000
      return helper(num/1000000000).strip + " billion " + helper(num%1000000000)
    else
      return helper(num/1000000000000).strip + " trillion " + helper(num%1000000000000)
    end
  end
end
