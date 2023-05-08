=begin
The Enumerable#drop_while method begins by iterating over the members of a collection, passing each element to the associated block until it finds an element for which the block returns false or nil. It then converts the remaining elements of the collection (including the element that resulted in a falsey return) to an Array, and returns the result.

Write a method called drop_while that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return all the elements of the Array, except those elements at the beginning of the Array that produce a truthy value when passed to the block.

If the Array is empty, or if the block returns a truthy value for every element, drop_while should return an empty Array.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

From the drop_while documentation:
https://ruby-doc.org/3.2.2/Array.html#method-i-drop_while

With a block given, calls the block with each successive element of `self`; stops if the block returns `false` or `nil`.
Returns a new array OMITTING those elements for which the block returned a truthy value.

With no block given, returns a new Enumerator

input: array
output: array

Goal: intake an array and pass its values to the block if it has them.  Return an array in which we have omitted the elements for which the block has returned a truthy value.
input: array
output: new array

Rules: 
- use only #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until 

E:
([1, 3, 5, 6]) { |value| value.odd? } == [6]
input: [1, 3, 5, 6]
output: [6]

1 is passed in and evaluates to true, thus omitted from return array
3 is passed in and evaluates to true, thus omitted from return array
5 is passed in and evaluates to true, thus omitted from return array
6 is passed in and evaluates to false, thus keeping this and any other numbers after it in the return array

([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
input: [1, 3, 5, 6]
output: same

1 is passed in and evaluates to false, thus adding it to the return array
3 is passed in and evaluates to false, adding it
5 is passed in and evaluates to false, adding it
6 is passed in and evaluates to true, adding this, but no more.

D:
array > array

A:
- initialize result array
- initialize counter to 0
- while the counter is less than the size of the array, iterate over the input array and pass each element to the block
  - while the element passed to the block returns from the block
=end

# def drop_while(array)
#   result = []
#   if block_given?
#     for ele in array
#       result << ele if !yield(ele)
#     end
#     result
#   else
#     array.to_enum
#   end
# end

def drop_while(array)
  counter = 0
  result = []
  while array.size > counter
    result << array[counter] if !yield(array[counter])
    counter += 1
  end
  result
end  # this misses the second test case because it doesn't include the last element 

# LS

def drop_while(array)
  index = 0

  while index < array.size && yield(array[index])
    index += 1
  end

  array[index..-1]
end

# JD

def drop_while(arr)
  idx = 0
  loop do
    break if !yield(arr[idx]) || idx == arr.size
    idx += 1
  end
  arr[idx..]
end

# This solution utilizes `while` to make it obvious that we want to stop prematurely, since we know that we may not be iterating through the entire array.
# Once we've skipped over the elements for which the block returns true, all we need to do is extract the remaining elements from the array, which we do with `array[index..-1]`; this *slicing* syntax extracts a slice of the array starting at `index`, and ending with the final element at index `-1`.



p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } #== [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []