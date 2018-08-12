class RPNCalculator
  # TODO: your code goes here!
  OPERATORS = [:+, :-, :*, :/]

  def initialize
    @num_stack = []
  end

  def push(num)
    @num_stack << num
  end

  def value
    @num_stack[-1]
  end

  def plus
    raise "calculator is empty" if @num_stack.length <= 1
    @num_stack << @num_stack.pop() + @num_stack.pop()
  end

  def minus
    raise "calculator is empty" if @num_stack.length <= 1
    second_num = @num_stack.pop()
    first_num  = @num_stack.pop()
    @num_stack << first_num - second_num
  end

  def divide
    raise "calculator is empty" if @num_stack.length <= 1
    second_num = @num_stack.pop()
    first_num  = @num_stack.pop()
    res = first_num.fdiv(second_num)
    @num_stack << res
  end

  def times
    raise "calculator is empty" if @num_stack.length <= 1
    @num_stack << @num_stack.pop() * @num_stack.pop()
  end

  def tokens(string)
    arr = string.split
    arr.map! {|e| OPERATORS.include?(e.to_sym)? e.to_sym : Integer(e)}
  end

  def evaluate(string)
    arr = tokens(string)
    arr.each do |e|
      case e
      when Integer
        push(e)
      when :+
        plus
      when :-
        minus
      when :*
        times
      when :/
        divide
      else
        raise "Invalid input!"
      end
    end
    value
  end
end
