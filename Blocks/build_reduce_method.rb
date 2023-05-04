=begin
`reduce` is another name for the `inject` method, and its main goal is to "fold" or "accumulate" a collection into 1 object.
What the specific folding or accumulation mechanism is depends on the code passed into the block.


=end

[1, 2, 3].reduce do |acc, num|
  acc + num
end

# 6

[1, 2, 3].reduce(10) do |acc, num|
  acc + num
end

# => 16

# Medium article: https://medium.com/@janetmndz/understanding-rubys-inject-reduce-enumerable-methods-in-under-5-minutes-193e5cff06d0

array = [1, 2, 3, 4, 5]

# def reduce(arr, accumulator=0)
  # if block_given?
    # yield(arr, accumulator)
  # else
    # 
  # end
# end
# 

def reduce(array, default=0)
  counter =0 
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end
# p reduce(array) {|acc, num| acc + num}
# p reduce(array, 10) { |acc, num| acc + num }
# p reduce(array) { |acc, num| acc + num if num.odd? }
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']