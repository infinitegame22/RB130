=begin
Thus far, we've used iterators often. You've seen the use of `#each`
and `#map` used on various data structures, such as Arrays and Hashes.
These methods make writing certain code a bit easier, at least when 
compared to a `while` or `for` loop. Yet, what we've seen thus far is 
only part of what is available.

Whenever we use `map` or `each` on something like an Array, we're using
something called "Internal Iteration". It's called that because the 
processa nd implementation of that iteration is hidden from us, and the
process that allows us to progress through a colelction is part of that 
hidden implementation.

There's also "External Iteration".  This is iteration that take place at
the behest of the user. 

=end

# https://blog.appsignal.com/2018/09/04/ruby-magic-closures-in-ruby-blocks-procs-and-lambdas.html#

# https://www.oreilly.com/library/view/the-ruby-programming/9780596516178/ch06s05.html#:~:text=Blocks%20are%20syntactic%20structures%20in,lambdas%20have%20method%2Dlike%20behavior.