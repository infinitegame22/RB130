=begin
The Enumerable#max_by method iterates over the members of a collection, passing each element to the associated block. It then returns the element for which the block returned the largest value.

Write a method called max_by that behaves similarly for Arrays. It should take an Array and a block, and return the element that contains the largest value.

If the Array is empty, max_by should return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Goal: intake an array and a block and return the element that has the largest value.

input: array
output: maximum element

Rules:
- do use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until 
- if array is empty, return `nil` from the method

E:
max_by([1, 5, 3]) { |value| value + 2 } == 5
input: [1, 5, 3]
output: 5
1 is passed into the block, added to 2 and saved to max
5 is passed into the block, added to 2 and saved as max because it is higher than the previous max
3 is passed to the block, added to 2 and disappears into the ether.
Returns the max element.

D:
array > element

A:
- return `nil` if input array is empty
- initialize `max` value to the element at index 0
- initialize `current_max` to the current element passed to the block
- iterate over the input array
  - pass the element to the block
  - if the result is greater than the current_max
    - reassign `max` to current element
- return max
=end

def max_by(array)
  return nil if array.empty?

  max = array[0]
  current_max = yield(max)
  array[1..-1].each do |ele|
    if yield(ele) > current_max
      current_max = yield(ele)
      max = ele
    end
  end
  max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil