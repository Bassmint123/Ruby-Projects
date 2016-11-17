# This program will compute the longest sequence of 1's in a binary string
arr = "11100001000100001111111100"
arr = arr.strip
n = arr.length
arr = arr.scan(/.{1,1}/).join(' ') # put on space in between every character
arr = arr.split(' ').map(&:to_i) 
#puts n
#print arr

count_a = 0
count_b = 0
arr.each do |x|
  if x == 1
    count_a += 1
	  if count_a > count_b
        count_b += 1
      end
  else
    count_a = 0

  end
end

print "longest sequence of 1's is: #{count_b}"