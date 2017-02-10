
# Using "to_sym" to convert each string into a symbol and push it into the symbols array
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

symbols = []
strings.each do |s|
     symbols.push(s.to_sym)
end

# Using intern to convert each string into a symbol and push it into the symbols array
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols = []
strings.each do |s|
     symbols.push(s.intern)
end

# Example of Hash Rocket notation
movies = {
    :Top_Gun => "A classic with Tom Cruise",
    :Gran_Torino => "A retired Dirty Harry"
}

# Same hash as above, but using the Ruby 1.9 syntax which no longer uses the Hash Rocket
# Rather, it now has only a space and the colon at the end of the symbol name
movies = {
    Top_Gun: "A classic with Tom Cruise",
    Gran_Torino: "A retired Dirty Harry"
}

#
# Demonstration of hash lookup being faster with symbol keys than with string keys. 
#
require 'benchmark'

string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]

string_time = Benchmark.realtime do
  100_000.times { string_AZ["r"] }
end

symbol_time = Benchmark.realtime do
  100_000.times { symbol_AZ[:r] }
end

puts "String time: #{string_time} seconds."
puts "Symbol time: #{symbol_time} seconds."

#
# Using the select method to filter a hash value
# Using delete to delete a hash value 
#
grades = { alice: 100,
  bob: 92,
  chris: 95,
  dave: 97
}

puts "Bob's age is #{grades[:bob]}"  # Using non-rocket notation to output bob's grade.
# Output => Bob's age is 92

grades.select {|name, grade| grade < 97} # Select grades less than 97
# ==> {:bob=>92, :chris=>95}

grades.select { |k, v| k == :alice } # Select key symbols equal to Alice
# ==> {:alice=>100}

# We can delete something from the hash too.
grades.delete(:chris)
grades.each {|name, grade| puts name}
# Output => alice
#           bob
#           dave

#
# We can iterate over just keys or just values using "each_key" and "each_value" methods
#
my_hash = { one: 1, two: 2, three: 3 }

my_hash.each_key { |k| print k, " " }
# ==> one two three

my_hash.each_value { |v| print v, " " }
# ==> 1 2 3

# We can iterate over the entire hash with both keys and values using standard notation
flash = { success: "It worked!", error: "It failed." }
flash.each do |key, value|
  puts "Key #{key.inspect} has value #{value.inspect}"
end
# ==> Key :success has value "It worked!"
# ==> Key :error has value "It failed."

# The inspect method, returns a string with a literal representation of the object it’s called on
puts (1..5).to_a  #Put an array as a string
# ==> 1 2 3 4 5
puts (1..5).to a.inspect # Put a literal array
# ==> [1,2,3,4,5]

puts :name, :name.inspect
# ==> name
# ==> :name
>> puts "It worked!", "It worked!".inspect
# ==> It worked!
# ==> "It worked!"

# By the way, using inspect to print an object is common enough that there’s a shortcut
#for it, the p function
p :name  # Same as 'puts :name.inspect'
# ==> :name


# Doing a nested hash. This is used in Rails a lot.
params = {}
params[:user] = {name: "Brad", city: "Chicago", state: "Illinois"}
puts params
# Output ==> {:user=>{:name=>"Brad", :city=>"Chicago", :state=>"Illinois"}}
puts params[:user][:city]
# Output ==> "Chicago"


#
# This is a Ruby program that can keep track of movie ratings
# This program has CRUD functionality, which stands for Create, Read, Update, and Delete.
#
movies = {
  Memento: 3,
  Primer: 4,
  Ishtar: 1
}

puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."

choice = gets.chomp.downcase
case choice
when 'add'
  puts "What movie do you want to add?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "What's the rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been added with a rating of #{rating}."
  else
    puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
  end
when 'update'
  puts "What movie do you want to update?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    puts "What's the new rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been updated with new rating of #{rating}."
  end
when 'display'
  movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
  end
when 'delete'
  puts "What movie do you want to delete?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    movies.delete(title.to_sym)
    puts "#{title} has been removed."
  end
else
  puts "Sorry, I didn't understand you."
end

