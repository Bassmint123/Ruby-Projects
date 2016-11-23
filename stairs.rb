# This is about creating staircase n number of steps by n number of # tags
puts "Enter size of staircase: "
size = gets.strip.to_i

staircase = []
hash = "#"
space = " "
spaces = 0
sizecount = size
# Fill the array with a space for every element
while spaces < sizecount
  staircase << space
  staircase.join("")
  sizecount -= 1	
end

n=0
sizecount = size - 1  # offset for the array element beginning at 0

# Build the staircase by deleting elements at the end and backfilling them with a hash
while n < size
  staircase.delete_at(sizecount)
  staircase << hash  
  sizecount -= 1
  puts "#{staircase.join("")}"
  n += 1
end
  
