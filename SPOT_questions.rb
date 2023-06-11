# EX1, IMPLEMENTATION, IMPLICIT BLOCK

def a_method
  yield
end

p a_method {"I'm a block in Example 1"}

# EX2 - IMPLEMENTATION, BLOCK PARAMETER

def a_method(&expecting_a_block)
  expecting_a_block.call
end

p a_method {"I'm a block in Example 2"}

# EX3 - IMPLEMENTATION, BLOCK PARAMETER

def b_method(&expecting_a_block)
  expecting_a_block.call
end

b_proc = proc {"I'm a block"}
p b_method(&b_proc)

# EX4 - IMPLEMENTATION

def c_method(expecting_a_proc)
  expecting_a_proc.call
end

c_proc = proc {"I'm a proc"}
p c_method(c_proc)

# https://stackoverflow.com/questions/32720002/when-to-use-implicit-or-explicit-code-blocks
# Implicit

def two_times_implicit
  return "No block" unless block_given?
  yield
  yield
end

puts two_times_implicit { print "Hello" }
puts two_times_implicit

# Explicit

def two_times_explicit(&i_am_a_block)
  return "No block" if i_am_a_block.nil?
  i_am_a_block.call
  i_am_a_block.call
end

puts two_times_explicit { puts "Hello" }
puts two_times_explicit

# https://ruby-doc.org/core-2.2.3/doc/syntax/methods_rdoc.html#label-Block+Argument

# https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/#:~:text=Blocks%20can%20be%20“explicit”%20or,a%20variable%20to%20use%20later.

=begin
Blocks can be "explicit" or "implicit".
Explicit means that I give it a name in my parameter list.
I can pass an explicit block to another method or save it into a variable to use later.

=end

def explicit_block(&block)
  block.call  # same as yield
end

explicit_block { puts "Explicit block called" }

# Notice the `&block` parameter, that's how I define the block's name.

# An implicit block is implemented using the `yield` keyword inside a method.
# When I do thi, the code inside the block will run and do its work.

def print_once
  yield
end

print_once { puts "Block is being run"}

# This method runs any block passed to `print_once`, as a result, `"Block is being run"` will be printed on the screen.

def one_two_three
  yield 1
  yield 2
  yield 3
end

one_two_three { |number| puts number * 10 }
  # 10, 20, 30

  # these arguments passed to the keyword `yield` become the block's arguments.

# 10: What is `yield` in Ruby and how does it work?
# In Ruby, the `yield` keyword is used to signify to Ruby to pass 

=begin
ne typical way to explain methods, interfaces, and polymorphism is to take several similar real-world objects as an example.

For instance, take a hen, a duck, and a turkey.

They all implement an interface for moving over a solid surface that consists of method walk(direction). This method is implemented slightly differently in each (you can tell one gait from another) but consistently.

They all implement an interface for producing sounds, that consists of method that we'd call quack(). Again, it has distinctly different implementations in all three.

Unlike two others, the duck implements another, aquatic interface, by having methods swim(depth) and dive. An attempt to call either of these on the hen or the turkey will end up in an infuriated and loud error message, or even in an abnormal termination of them.

One more important interface is aerial, consisting of take_off, fly, and land methods. Support of this interface is uneven. While the duck and the turkey reasonably implement all three, the hen has mere stub implementations of take_off and land and lacks an implementation of fly. The latter is a regression in implementation, because hen's ancestors have a well-working implementation. But since nobody seems to ever invoke hen.fly(), it is not even planned to be fixed. On the other hand, duck has an enhanced implementation of land(surface) that accepts both land and water objects as the argument.

In languages with a static class hierarchy a bird should be formally certified as a duck to function as one. Ruby implements duck typing, allowing a bird that quacks like a duck and walks like a duck to be accepted as a duck.

Note that the above only applies to situations where locomotion and sound production is involved. In other contexts, e.g. roasting, a bird that does not implement correct cooking and tasting interfaces could make a subsequent operation of eating fail unexpectedly. Ruby lacks built-in means to check for this beforehand, but has enough flexibility to implement such a check manually when required, at an additional cost.

It's important to notice that all methods has an implicit parameter, self. There's no way to quack abstractly, one needs an instance of a e.g. duck; duck's self defines concrete details of method invocation. The whole point of objects (that is, of self) is to hold some state. For instance, duck's hunger level is a part of the duck's state. The implementation of quack consults the hunger value of self, and increases volume accordingly.

Importance of internal state can be seen on methods like get_mass. Various other methods, like peck, drink, or excrete change the summary mass. get_mass is shared by all objects in the universe. It is likely to have only one canonical implementation, inherited by all objects, including our three birds. Different implementations of quack and walk by different birds is an example of implementation polymorphism.

Hope this helps :)

https://softwareengineering.stackexchange.com/questions/225402/how-do-i-explain-a-ruby-method-with-a-real-world-analogy

=end

def do_something
  if block_given?
    yield
  else
    puts "No block is provided"
  end
end

do_something { puts "Executing block" }
# Output: Executing block

# If we have the yield keyword not gated behind a method like block_given? It makes passing a block to the method mandatory. We can also make methods have an explicit block requirement.

We have a few core tools in ruby which allow us to modify and manage our development enviroment. We have Version managers such as rbenv and RVM, we have package managers such as RubyGems, we have dependacy managers such as bundler and tools for automation such as rake. 

Every Ruby project is built on a specific version of Ruby. When a developer attempts to run someone else's project on their local machine they should use the same version the project uses as it may not support the same features as the version running on their local machine. Ruby version managers like RVM and rbenv allow us to install and manage different versions of Ruby on our local machine. 

We have package managers such as RubyGems which allow us to download, install and use external libraries or applications which can be used in our programs or from the command line. 

A RubyGem or Gem is an external library or application which can be downloaded, installed and used in our Ruby programs or from the command line. The `gem` command comes standard with Ruby installation most modern versions of ruby, this command allows us to install and manage our Gems. Gems help us extend or modify the functionality of our programs. 

One useful gem that most ruby developers use is the `bundler` gem. `bundler` is a dependency manager. Just as every project depends on a specific version of ruby to execute properly, it also depends on specific versions of the gems it requires to execute properly.  

Bundler allows you to specify excatly which Ruby version and Gems you want to use for your Ruby applications. In particular, it enables the installation of multiple versions of each Gem within a designated Ruby version and manages the appropriate use of the respective version in your application.


Rubygems - package manager
Bundler - dependency manager
Rbenv/RVM - version manager
Rakefile - automation tool for managing tasks

Fixsum
