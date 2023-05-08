=begin
The Array#zip method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order. 

Write your own version of zip that does the same type of operation. It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.

Goal: Intake two arrays and output one array that combines these two into a single array and each element is a two-element array where the first element is a value from the calling object and the second element is a value from the array passed in as an argument, in order.

Input: two array objects
Output: one array containing subarrays of the elements zipped together

Rules:
- do not use the `zip` method
- assume both input arrays have the same number of elements
- no block involved

D: 
arrays > storage array

A:
- initialize storage array
- iterate over the indices of the first array
  - push the element at each index of both arrays into the storage array as a subarray
- return the storage array

=end

def zip(array1, array2)
  result = []
  array1.each_index do |idx|
    result << [array1[idx], array2[idx]]
  end
  result
end

def zip(array1, array2)
  array1.each_index.with_object([]) do |idx, result|
    result << [array1[idx], array2[idx]]
  end
end


p [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]