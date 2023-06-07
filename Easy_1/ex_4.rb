=begin
Write a method that returns a list of all of the divisors of the positive integer passed
in as an argument. 
input: integer
output: array of integers

Goal: intake an integer and return an array of the integers that are the divisors of input integer

E:
divisors(1) == [1]
1 % 1
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

D:
range >> array

A:
- iterate over the range of numbers from 1 to the input number
- select from the range the numbers that are divisors of the input number, ie when the current number is passed as an argument
to the modulo method with the calling object as the input integer and the result is 0, the current number is a divisor of the input.
=end

# def divisors(integer)
#   (1..integer).select { |num| integer % num == 0 }
# end

def divisors(integer)
  1.upto(Math.sqrt(integer)).select {|i| integer%i == 0}
end

# Joseph Liang further exploration

# Further Exploration using map
def divisors(num)
  first_half = (1..Math.sqrt(num).round).select { |divisor| num % divisor == 0 }
  second_half = first_half.map { |divisor| num / divisor }.reverse
  (first_half + second_half).uniq
end

p divisors(1) == [1]
p divisors(7) # == [1, 7]
p divisors(12) # == [1, 2, 3, 4, 6, 12]
p divisors(98) # == [1, 2, 7, 14, 49, 98]
p divisors(99400891) # == [1, 9967, 9973, 99400891] # may take a minute