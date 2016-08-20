# Doing loops in Ruby

counter = 1
while counter < 11
  puts counter
  counter = counter + 1
end

# Example of an Until loop
counter = 1
until counter == 10
  puts counter
  counter += 1
end
puts counter

# Prints 1 through 9 due to three dots.
for num in 1...10
  puts num
end

# Prints 1 through 15 due to two dots.
for num in 1..15
  puts "#{num}"
end

# In Ruby for a loop, curly braces ({}) are generally interchangeable with the keywords do (to open the block) and end (to close it). 
i = 20
loop do
  i -= 1
  print "#{i}"
  break if i <= 0
end

# Usint the break statement here. We are printing out Ruby! 30 times.
m = 0
loop do
    m += 1
    print "Ruby!"
    break if m==30
end

# By adding the next statement, we check for odd numbers and print them.
i = 20
loop do
  i -= 1
  next if i % 2 == 1
  print "#{i}"
  break if i <= 0
end

# Looping with an array
array = [1,2,3,4,5]

array.each do |x|
  x += 10
  print "#{x}"
end

numbers = [1, 2, 3, 4, 5]

# one way to loop
numbers.each { |item| puts item }

# another way to loop
numbers.each do |item|
  puts item
end

# Using the odds array to perform an arithmetic operation
odds = [1,3,5,7,9]

odds.each do |x|
  x *= 2    
  print "#{x}"
end
  
# The .times method is a like a super compact for loop
 5.times{print "This is a test."}

# Indexing an array. Print the third number 
demo_array = [100, 200, 300, 400, 500]
print  "#{demo_array[2]}"

# Multi dimensional arrays
multi_d_array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
multi_d_array.each { |x| puts "#{x}\n" }

 
