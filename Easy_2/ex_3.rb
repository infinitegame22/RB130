=begin
The Enumerable#map method iterates over the members of a collection, using the associated block to perform some sort of operation on each collection member. The returned values from the block are then built up into an Array that is then returned to the caller. Note in particular that every time #map yields to the block, it obtains just one value. That value may be a complex value - it may even be another collection - but it is nevertheless just one value. Thus, #map returns an Array that has the same number of elements that the original collection had.

Write a method called map that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return a new Array that contains the return values produced by the block for each element of the original Array.

If the Array is empty, map should return an empty Array, regardless of how the block is defined.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Goal: intake an array with a block.  Return a new array that contains the return values produced by the bloc kfor each element of the original array.

input: array
output: array

Rules:
- allow for each, each_with_object, each_with_index, inject, loop, for, while or until
- if the input array if empty, the map method should return an empty array, despite the block.

E: 
1**2 == 1
3 ** 2 == 9
6 ** 2 == 36
D:
array > result array
A:
- initialize empty array `result`
- iterate over input array
  - pass each element to the block and push the result into the result array
- return the result array
=end

require 'set'

def map(collection)
  result = []
  collection.each { |element1, element2| result << yield(element1, element2)}
  result
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map({"one" => 1, "two" => 2}) { |key, value| "#{key}: #{value * 2}" }

# Since blocks are so lenient (and have lenient arity), when we iterate over our `collection`, we can
# extract a variable # of parameters from each iteration: `el1` AND/OR `el2`.

# The main point isn't the specifics here, but the fact that blocks provide a whole new level of flexibility to our program, amplified by the fact that they ahve lenient arity (loose argument counts).