=begin
close -- Closes the file. Like File->Save.. in your editor.
read -- Reads the contents of the file. You can assign the result to a variable.
readline -- Reads just one line of a text file.
truncate -- Empties the file. Watch out if you care about the file.
write('stuff') -- Writes "stuff" to the file.

Here is the difference between the gets.chomp and the one that uses $stdin.gets.chomp
 gets.chomp() = read ARGV first

 STDIN.gets.chomp() = read user's input


This is an example of reading and writing to a file.
The file "test1.txt" needs to be accompanied by it.
To run this program open PowerShell and type: ruby read-write_to_a_file.rb test1.txt
=end
##################################################

filename = ARGV.first

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

$stdin.gets  # we could also use STDIN.gets

puts "Opening the file..."
target = open(filename, 'w')

puts "Truncating the file.  Goodbye!"
target.truncate(0)

puts "Now I'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = STDIN.gets.chomp  # swapping $stdin for STDIN to show they work similarily
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

puts "And finally, we close it."
target.close