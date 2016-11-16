# This program will compute the number of 1's and 0's in a binary string
arr = "11100001000100001111100"
arr = arr.strip
n = arr.length
arr = arr.scan(/.{1,1}/).join(' ') # put on space in between every character
arr = arr.split(' ').map(&:to_s) 
#puts n
#print arr

length = 0
one_count = 0 
zro_count = 0
arr.each do |x|
  if x == "1"
    one_count += 1
  else
    zro_count += 1
  end
end

puts "number of 1s is: #{one_count}"
puts "number of 0s is: #{zro_count}"



