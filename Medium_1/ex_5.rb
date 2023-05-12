items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for `gather` so that they produce the output

# gather(items) do |*produce, wheat |
  # puts "Let's start gathering food."
  # puts produce.join(', ')
  # puts wheat
  # puts "We've finished gathering!"
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
# 
# gather(items) do | fruit, *veggies, wheat|
  # puts fruit
  # puts veggies.join(', ')
  # puts wheat
# end
# 
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# gather(items) do | fruit , *produce|
  # puts fruit
  # puts produce.join(', ')
# end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do | item1,item2,item3,item4|
  puts "#{item1}, #{item2}, #{item3}, and #{item4}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!