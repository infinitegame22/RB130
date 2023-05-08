=begin
The Enumerable#count method iterates over the members of a collection, passing each element to the associated block. It then returns the number of elements for which the block returns a truthy value.

Write a method called count that behaves similarly for an arbitrarily long list of arguments. It should take 0 or more arguments and a block, and then return the total number of arguments for which the block returns true.

If the argument list is empty, count should return 0.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.


Goal: intake 
=end

def count(*elements)
  counter = 0
  elements.each do |ele|
    counter += 1 if yield(ele)
  end
  counter
end

# Adam Dresher

def count(*objs)
  if block_given?
    objs.inject(0) { |counter, obj| yield(obj) ? counter + 1 : counter }
  else
    objs.size
  end
end

# Unlike many other Enumerable methods, when the Enumerable#count method is not passed a block, it returns the number of elements within its caller. Here's my attempt to represent that behavior.

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3