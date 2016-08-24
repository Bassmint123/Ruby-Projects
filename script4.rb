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

# Doing a hash table. As a reminder, a hash is a collection of key-value pairs.
my_hash = { 
  "name" => "Eric",
  "age" => 26,
  "hungry?" => true
}

puts my_hash["name"]
puts my_hash["age"]
puts my_hash["hungry?"]

# Different way declaring a hash using the new function
pets = Hash.new
pets["Bud"] = "cat"
pets["Tweetie"] = "Bird"
# Access the Hash elements
puts pets["Bud"]
puts pets["Tweetie"]


# Mixing arrays and Hashes
friends = ["Milhouse", "Ralph", "Nelson", "Otto"]

family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}

friends.each { |x| puts "#{x}" }  # Remember that .each is a do loop function
family.each { |x, y| puts "#{x}: #{y}" }


# As we iterate through the array, as usual, we can use any placeholder name for the bit between two | | characters.
languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
languages.each { |whatever| puts whatever}

# Interating over an array of arrays.
s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]
s.each { |sub_array| puts sub_array }

# Interating over a Hash
secret_identities = {
  "The Batman" => "Bruce Wayne",
  "Superman" => "Clark Kent",
  "Wonder Woman" => "Diana Prince",
  "Freakazoid" => "Dexter Douglas"
}
  
secret_identities.each do |identity, name|
  puts "#{identity}: #{name}"
end

# Input for hash program
the 2
falls 1
on 1
mainly 1
in 1
rain 1
plain 1
Spain 1

# Builds a histogram takes a user's input, then builds a hash from that input. 
# Each key in the hash will be a word from the user; each value will be the number of times that word occurs.
puts "Text please: "
text = gets.chomp

words = text.split(" ")
frequencies = Hash.new(0)
words.each { |word| frequencies[word] += 1 }
frequencies = frequencies.sort_by {|a, b| b }
frequencies.reverse!
frequencies.each { |word, frequency| puts word + " " + frequency.to_s }


























 
