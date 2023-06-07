=begin
Write a method that takes an optional block. If the block is specified, the method
should execute it, and return the value returned by the block. If no block is 
specified, the method should simply return the String `Does not compute`.


=end

def compute
  if block_given?
    yield
  else
    'Does not compute.'
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further

def compute(obj)
  return 'Does not compute' unless block_given?
  yield(obj)
end

p compute(3) == 'Does not compute'
p compute('hello') { |el| el + ' you'} #== 'hello you'
p compute(10) { |int| int + 3 } == 13

# Brenno

# Further exploration:
def compute(arg="default")
  block_given? ? yield(arg) : "Does not compute."
end

# Further exploration with explicit block parameter:
def compute(arg="default", &block)
  block_given? ? block.call(arg) : "Does not compute."
end

chars = :chars.to_proc

p compute(3) {|arg|[1, 2] << arg} # => [1, 2, 3]
p compute("echo") {|arg| arg * 2} # => "echoecho"
p compute(&:upcase)               # => "DEFAULT" (implictly calls `to_proc` on the `Symbol` obj)
p compute(&chars)                 # => ["d", "e", "f", "a", "u", "l", "t"] (passing a Proc obj)
p compute("no block")             # => "Does not compute."
p compute                         # => "Does not compute."