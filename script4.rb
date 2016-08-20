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

# By adding the next statement, we check for odd numbers and print them.
i = 20
loop do
  i -= 1
  next if i % 2 == 1
  print "#{i}"
  break if i <= 0
end