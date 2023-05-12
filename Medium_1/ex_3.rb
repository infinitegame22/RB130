=begin
Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end

# LS

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) {|produce| puts produce.join('; ')}

=begin
To accomplish our task, we need to `yield` the `items` array to a block.
Moving the implementation of our `items` formatting to a block
gives the user more flexibility and choise for how they wish to use `gather`.
By yielding `items` to a block, the user can `join` those items for presentation
purposes or they can choose a completely different representation.
=end

gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end
