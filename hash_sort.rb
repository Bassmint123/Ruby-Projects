# Examples of sorting through a hash by key or value

people = {
  :fred => 23,
  :joan => 18,
  :pete => 54
}

puts people.keys.sort
puts people.values.sort

people.sort_by { |name, age| age }

puts people


# A little more complicated approach
people = {
  :fred => { :name => "Fred", :age => 23 },
  :joan => { :name => "Joan", :age => 18 },
  :pete => { :name => "Pete", :age => 54 }
}

puts people