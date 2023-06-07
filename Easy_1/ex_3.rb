=begin
Write a method that takes a sorted array of integers as an argument, and returns an
array that includes all of the missing integers (in order) between the first and last
elements of the argument.

input: array
output: array

Goal: its like a range of numbers are input and we need to return the missing ones

E:
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
range from -3 to 5 numbers not include in input array -> [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
range from 1 to 4 has no missing numbers so empty array is output
missing([1, 5]) == [2, 3, 4]
missing([6]) == []
- if only one item in the input array, output an empty array as well

D:
- range
- array

A:
- return an empty array if the size of the input array is 1
- initialize `result` to empty array
- iterate over the range from the first item plus 1 of the input array up to but not including the last item in the input arry
  - if the current number is not found in the input array, push it into the result array
- return result
=end

def missing(array)
  #return [] if array.size == 1
  
  (array[0]...array[-1]).each_with_object([]) { |num, result| result << num if !array.include?(num)}
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []