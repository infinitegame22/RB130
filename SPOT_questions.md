# Practice Questions

10. What is `yield` in Ruby and how do we use it? 

In Ruby, the yield keyword is used to define a block within a method. It allows you to transfer control from the method to the block and then return to the method when the block execution is complete. Essentially, yield enables you to create methods that can accept blocks of code as arguments.

Here's an example to illustrate the usage of yield:

ruby
Copy code
def greet
  puts "Hello!"
  yield if block_given?
  puts "Goodbye!"
end

greet do
  puts "Welcome to the Ruby world!"
end
In this example, we define a method called greet. Within the method, we use puts to display "Hello!" and "Goodbye!". Then, we have the yield statement, which checks if a block has been passed to the method using the block_given? method. If a block is provided, the control is transferred to the block and the block code is executed.

When you invoke the greet method with a block, like in the example above, the block code puts "Welcome to the Ruby world!" will be executed after the "Hello!" message is displayed. Finally, the control returns to the greet method, and the "Goodbye!" message is printed.

The output of running this code will be:

css
Copy code
Hello!
Welcome to the Ruby world!
Goodbye!
If you call the greet method without a block, like greet, the yield statement is skipped, and only the "Hello!" and "Goodbye!" messages are displayed.

This is just a basic example to demonstrate the usage of yield. yield can be powerful when you need to provide flexibility and customization in your methods by allowing users to pass in blocks of code to be executed at specific points within the method.

11. How do we check if a block is passed into a method?

In Ruby, you can check if a block is passed into a method by using the block_given? method. This method returns true if a block is provided when the method is called, and false otherwise. Here are a couple of examples:

Example 1: Method without a block

ruby
Copy code
def do_something
  if block_given?
    puts "A block is provided"
  else
    puts "No block is provided"
  end
end

do_something
# Output: No block is provided
Example 2: Method with a block

ruby
Copy code
def do_something
  if block_given?
    yield
  else
    puts "No block is provided"
  end
end

do_something { puts "Executing block" }
# Output: Executing block
In the first example, the do_something method checks if a block is given using block_given? and prints the corresponding message.

In the second example, the do_something method again checks if a block is given using block_given?. If a block is provided, it executes the block using the yield keyword. In this case, the block contains the code puts "Executing block", which is printed as output.

12. Why is it important to know that methods and blocks can return closures in Ruby?

Knowing that methods and blocks can return closures is of paramount importance, for it unlocks the power of encapsulating behavior within a portable package. A closure is a delightful combination of code and its surrounding environment.  When a method or block returns a closure, this is a snippet of executable code that remembers its surroundings, even when executed and used elsewhere.

For example, let's say we have a method called `greetings_generator` that takes a name as an argument and returns a closure.  Within this closure, the name is captured and stored for future use.

```ruby
def greetings_generator(name)
  proc { |greeting| puts "#{greeting}, #{name}!" }
end

wizard_greetings = greetings_generator("Gandalf")
wizard_greetings.call("Greetings")  # => "Greetings, Gandalf!"
```
By returning a closure from the method, we created a reusable chunk of functionality capable of greeting the chosen name.  The closure retains a reference to the `name` variable allowing us to offer personalized greetings whenever invoked.

Another example of how blocks can yield closures as well.  When a method yields a closures, it grants the user the ability to manipulate its behavior from within the method.

```ruby
def sorcery
  puts "Before enchantment"
  yield if block_given?
  puts "After enchantment"
end

sorcery do
  puts "Behold the magic within!"
end
```
By yielding to a closure, the `sorcery` method allows the provided block to create its own magic inside of the method call.

13. What are the benefits of explicit blocks?

- Explicit blocks provide additional flexibility. The advantage of having a variable that represents the block is that we can pass the block to another method.  can be used as arguments with another method.  Use the explicit block to convert the proc to a block for execution.  

```ruby

  def puppy_check(&block)
    arr =['small', 'killer', 'mr.cheese']
    arr.each &block
  end

  block = proc { |dog| puts dog }
   
  puppy_check(&block) # => small, killer, mr. cheese

  def my_method(&block)
  block.call
end

my_proc = proc { puts "Hey there"}
my_method(&my_proc) # => Hey there
```

14, Describe the arity differences of blocks, procs, methods and lambdas.

1. Blocks are chunks of code enclosed either within `{}` or `do...end` keywords. They are not standalone objects and are typically associated with methods. Blocks have lenient arity meaning Ruby doesn't complain when passing in too many or too few arguments to a block.

`[1,2,3].each { |num, int| puts num * 2 }`

The block example above 

2. Procs are objects that encapsulate blocks of code. They can be created using the `Proc.new` or `proc` methods. Procs have lenient arity just like blocks.

```ruby
my_proc = Proc.new { |a, b| puts a + b }
my_proc.call(2,3,4) # Output: 5
```

In the code snippet above when we pass in the three integers `2`, `3`, and `4` as arguments to the `call` method, Ruby does not throw an ArgumentError and is able to assign `2` and `3` to the block arguments `a` and `b`.

3. Methods:
Methods in Ruby are defined using the `def` keyword and can have a specified number of parameters.  Methods have strict arity so they need to be called with the exact number of arguments they are defined with or else Ruby will throw an ArgumentError.

```ruby
def add_numbers(a,b)
  puts a + b
end

add_numbers(2, 3) # => 5
add_numbers(2, 3, 4) # => ArgumentError
```
4. Lambdas:  Lambdas are types of procs, but they have stricter arity rules. They can be created using the lambda keyword or the `->` (stabby lambda) syntax. Lambdas check the number of arguments passed to them and raise an error if the arity does not match.

```ruby
my_lambda = ->(a, b) { puts a + b }
my_lambda.call(2, 3)  # Output: 5
```

16. What does & do when in a the method parameter?

`def method(&var); end`

When we use the & symbol in a method definition parameter, it is used to convert a block or Proc object into a block (more specifically, it converts a Proc object to a block).
Here’s an example:
def my_method(&block)
  block.call
end

my_proc = Proc.new { puts "Hello, world!" }

my_method(&my_proc)
In this example, we define a method called my_method that takes a block as an argument. We use the & symbol in front of the blockparameter to convert the block into a Proc object and assign it to the block variable.
We then create a Proc object called my_proc that prints “Hello, world!” when executed. Finally, we call the my_method method with the my_proc object passed in as an argument, using the & symbol to convert it back to a block.
When we execute the code, the my_method method is called with the my_proc Proc object passed in, and the “Hello, world!” message is printed, since we used the call method on the block parameter to execute the block.
So, when we pass a Proc object to a method that has the & symbol in front of a parameter, it will convert the Proc object to a block and assign it to the parameter, making it callable within the method.

Using & before a parameter is a way to handle and work with blocks of code as objects in Ruby. It’s commonly used when you want to pass a block to another method or store it for later use.

In the method definition the `&` converts the block object to a Proc.  

17, What does & do when in a method invocation argument?

`method(&var)`
- converts Proc to a block so that the method expecting the explicit block gets what it needs.

18. What is happening in the code below?

arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s) # specifically `&:to_s`

Symbol to Proc

A RubyGem or Gem is a external library or application which can be downloaded, installed and used in our Ruby programs or from the command line. The `gem` command comes standard with Ruby installation now a days, this command allows us to instal and manage our Gems.

18. What is happening in the code below?

```ruby
arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s) # specifically `&:to_s`
```

Just like Proc objects, objects that are not a proc can be converted to a block when prepended by the unary &.  But first Ruby needs to convert that object to a proc object, then to a block. When that object is a symbol ruby uses the `Symbol#to_proc` method to convert that object into a Proc first. This proc's closure takes one argument and will call a method on the argued object based on the name of the calling symbol object. In the example below the `&:to_s` is equivalent to creating a proc object which will be converted to this block `{|w| w.to_s}` when prepended by the unary & in the method call to map.

we execute on the object passed in as the argument because an an argument doesn't exist until an object is passed in and attached to it.  

```ruby
def call_this
  yield(2)
end

# your code here
to_s = proc { |num| num.to_i }
to_i = Proc.new { |num| num.to_s }


p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"

def call_this
  yield(2)
end

# your code here
to_s = false
a = proc do |x| 
  to_s = !to_s
  to_s ? x.to_i : x.to_s
end

p call_this(&a) # => returns 2
p call_this(&a) # => returns "2"

def call_this
  yield(2)
end

# your code here
def changer 
  to_s = false
  proc do |x| 
    to_s = !to_s
    to_s ? x.to_i : x.to_s
  end
end 

a = changer 

p call_this(&a) # => returns 2
p call_this(&a) # => returns "2"
```

modifying the variable as part of its closure.

20, How do we invoke an explicit block passed into a method using &? Provide example.

```ruby
def invoke_block(&block)
  # Now, we can invoke the block using the call method
  block.call
  yield() # will output a second time as we yield to the method
end

my_block = Proc.new { puts "Hello, block!" }

# Invoke the block using the method
invoke_block(&my_block) # => Hello, block!
                        #    Hello, block!
```

When we invoke a method that defines a final parameter which is prepended by the unary `&` and pass that method a block upon invocation, that blcok is converted to a Proc and assinged to the arugment name after the `&`. We can then call the  `Proc#call` on that object or directly yield to the block that was passed in as it is still available to exectue the block. 

```ruby
def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
```
This code will output 'This is a turtle and a .' and return nil.

On line 69 we call `block_method` and pass the string `'turtle'` and a block as arguments to the method call. Inside this method the string is assigned to the method local variable `animal`. 
In this method we yield to the block and pass the object refernced by `animal` to it. The string `'turtle'` is then assigned to the block parameter `turtle` and the block parameter `seal` is not passed an arugment so it is assigned to `nil`. This is due to the arity of blocks which is the rule regarding the number of arugments a block proc or lambda requrie for the code to run without errors. Blocks have lenient arity meaning they do not require the exact number of arguments they define in their parameter list (everythingbetween the `||`). If they recived less arugments any unassinged parameters will be assigned to nil and if they rrecive more arugments then any extra arugments will be ignored. 
So when we interpolate our arugments into the string and output them to the screen with `#puts` we will get `'This is a turtle and a .'` because `nil` interpolates to an empty string. 

This code will output 'This is a turtle and a .' and return nil.

On line 69 we call `block_method` and pass the string `'turtle'` and a block as arguments to the method call. Inside this method the string is assigned to the method local variable `animal`. 
In this method we yield to the block and pass the object refernced by `animal` to it. The string `'turtle'` is then assigned to the block parameter `turtle` and the block parameter `seal` is not passed an arugment so it is assigned to `nil`. 
Unlike methods a block will not thorw an error if passed the incorrect number of arguments. 
This is due to the arity of blocks which is the rule regarding the number of arugments a block proc or lambda requrie for the code to run without errors. Blocks have lenient arity meaning they do not require the exact number of arguments they define in their parameter list (everythingbetween the `||`). If they received less arugments any unassinged parameters will be assigned to nil and if they rrecive more arugments then any extra arugments will be ignored. 
So when we interpolate our arugments into the string and output them to the screen with `#puts` we will get `'This is a turtle and a .'` because `nil` interpolates to an empty string. 

```ruby
def block_method(animal)
  yield(animal)
end

block_method('turtle') { puts "This is a #{animal}."}
# => NameError: no local variable or method found
```
This code will throw a `NameError` when run.  The block local variable `animal` has no value to reference and thus cannot be interpolated into the string.
On line 88 we invoke the `block_method` and pass it one string argument `'turtle`' and one block argument `{puts "This is a(n) #{animal}."}`.  A block only knows its own scope unless we pass it an object specifically to be assigned to a local block parameter. For example, if we add a block parameter `|animal|` to the code above, this code executes as imagined.

```ruby
def block_method(animal)
  yield(animal)
end

block_method('turtle') { |animal| puts "This is a(n) #{animal}."}

# => This is a turtle.
```

What are the core tools of Ruby?

We have a few core tools in Ruby which allow us to modify 

A RubyGem or Gem is a external library or application which can be downloaded, installed and used in our Ruby programs or from the command line. The `gem` command comes standard with Ruby installation now a days, this command allows us to instal and manage our Gems.