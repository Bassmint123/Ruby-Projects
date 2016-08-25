def prime(n)
  puts "That's not an integer." unless n.is_a? Integer
  is_prime = true
  for i in 2..n-1
    if n % i == 0
      is_prime = false
    end
  end
  if is_prime
    puts "#{n} is prime!"
  else
    puts "#{n} is not prime."
  end
end

prime(2)
prime(9)
prime(11)
prime(51)
prime(97)

# Simple creation of method and calling it
def array_of_10
  puts (1..10).to_a
end

call array_of_10

# Testing out the splat feature of Ruby. It lets Ruby know
# the number of parameters being passed to a method is unknown
def what_up(greeting, *bros)
  bros.each { |bro| puts "#{greeting}, #{bro}!" }
end
 
what_up("What up", "Justin", "Ben", "Kevin Sorbo")

# The first method greeter returns a greeting with string parameter
# The second method by_three? checks if a number is evenly divisible by three or not
def greeter(name)
    return "Hello " + name
end

def by_three?(number)
    if number % 3 == 0
       return true
    else
       return false
    end
end

greeter("Brad")
by_three?(9)

# Example of a "code block" which is also fairly similar to an anonymous function in JavaScript
# There are some differences between blocks and methods. Blocks are like nameless methods. 
5.times do   # print it five times
  puts "I'm a code block!"
end

5.times { puts "As am I!" }  # print it five times

#
# method that capitalizes a word
#
def capitalize(string) 
  puts "#{string[0].upcase}#{string[1..-1]}"
end

capitalize("ryan") # prints "Ryan"
capitalize("jane") # prints "Jane"

# block that capitalizes each string in the array
["ryan", "jane"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"} # prints "Ryan", then "Jane"

# Passing a block to a method is a great way of abstracting certain tasks from the method and
# defining those tasks when we call the method. Abstraction is an important idea in computer science, 
# and you can think of it as meaning "making something simpler." 
# The block, {|i| puts i}, is passed the current
# array item each time it is evaluated. This block
# prints the item. 
[1, 2, 3, 4, 5].each() { |i| puts i } # The parethesis are optional

# This block prints i multiplied with the number 5 for each item.
# (It chooses to ignore the passed item, which is allowed.)
[1, 2, 3, 4, 5].each { |i| puts i * 5 }

my_array = [3, 4, 8, 7, 1, 6, 5, 9, 2]

# Calls the sort! method on my_array below.
# my_array should then equal [1, 2, 3, 4, 5, 6, 7, 8, 9].
my_array.sort!


# library sorting code
books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]
# Sort the books into alphabetical order?
books.sort!
# To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }
# Sort your books in descending order, in-place below
books.sort! { |firstBook, secondBook| secondBook <=> firstBook }


# An example using the combined comparison operator
# It should return -1 if the first block parameter should come before the second, 
# 1 if vice versa, and 0 if they are of equal weight, meaning one does not come before 
# the other (i.e. if two values are equal).
book_1 = "A Wrinkle in Time"
book_2 = "A Brief History of Time"
result = book_1 <=> book_2  
puts "#{result}"




