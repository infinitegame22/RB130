array = [1, 2, 3, 4, 5]

# LS

def select
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    result << current_element if yield(current_element)
    counter += 1
  end

  result
end

array.select {|num| num.odd?}  # => [1, 3, 5]
array.select {|num| puts num}  # => [], because return of a call to `puts` is nil
array.select {|num| num + 1}  # => [1, 2, 3, 4 ,5] because the return value of the block is truthy