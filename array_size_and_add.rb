# Here we take a string of numbers and convert them to an array of integers
# Then we add up all the integers in the array to get the final sum.
print "How many numbers do you want in the array? "
arr_size = Integer(gets.chomp)
print "Your array size will be #{arr_size}\n"

array_nums = []

n = 0
while n < arr_size
    print "Enter array element #{n} > " 
	input = gets    # get input gets returns nil, which cannot be chomped. 
	                # Therefore, you need to make sure, that you work on an actual string before calling chomp.
	input ||= ''    # set to empty string if nil
	input.chomp!    # remove trailing newline
    array_nums << input  # using the insertion operator here.
    n += 1
end
print "Your array is: " + array_nums.join(", ")

arr_ints = array_nums.map(&:to_i) # convert array elements to integers

ans = 0
arr_ints.each do |x|
  ans += x
end

print "\nThe numbers in the array add up to: #{ans}"

