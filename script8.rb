# Example of a code block
5.times do |x|
  puts "I'm a block!"
end
# Refactored another way
5.times {puts "I'm a block!"}

# The collect method takes a block and applies the expression in the block to every element in an array. 
my_nums = [1, 2, 3]
my_nums.collect { |num| num ** 2 }
# ==> [1, 4, 9]
# However,
# my_nums is still [1, 2, 3]. This is because .collect returns a copy of my_nums, 
# but doesn't change (or mutate) the original my_nums array.

# If we want to do that, we can use .collect! with an exclamation point:
my_nums.collect! { |num| num ** 2 }
# ==> [1, 4, 9]
my_nums
# ==> [1, 4, 9]

