# Ruby gives us a lot of flexibility when assigning arrays to variables. If we want to assign the entire array to a single variable, we can do that:

birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']

# If we want to assign every element to a separate variable, we can do that too:

raven, finch, hawk, eagle = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p hawk # => 'hawk'
p eagle # => 'eagle'

=begin
Suppose we want to organize our array contents into groups, where variables represent
category names. Can we do that without extracting items directly from the array based on their
indices?

We can use the splat operator (*) to do something like this:
=end

raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors # => ['hawk', 'eagle']

=begin
Based on the examples shown above, write a method that takes an array as an argument. The method 
should yield the contents of the array to a block, which should assign my block variables in such a way
that it ignores the first two elements, and groups all remaining elements as a `raptors` array.
=end

# def split_into_multiple_variables(array)
#   yield(array)
# end

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end

=begin
For LS solution, we start with an array named `birds`. It contains four birds, where two
of them are raptors. Above we use our block variables to organize it further. When we yield
`birds` to the block, Ruby assigns the individual elements of `birds` to the different block 
variables. It assignes the first two birds, "crow" and "finch" to `_`; the underscore tells 
Ruby that we aren't interested in those values. The splat operator on the name block variable tells Ruby 
to treat is as an Array and assign all remaining arguments to it. Here, we group the last two
elements from `birds` into the array, `raptors`. 

For demonstration purposes, we join the two array elements and output them to the screen as:

`Raptors: hawk, eagle`
=end