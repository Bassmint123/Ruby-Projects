# Method for opening a file, reading it, and printing to the screen.
def reed
   File.open("read_and_write.txt").each do |line|
      puts line
   end
end

# Method for writing to a file by "appending" a new line
def wryte
   File.open("read_and_write.txt", "a") do |line|
      line.puts "\r" + "Go air up the bike tires"
   end
end

# Make calls to the two methods
reed
wryte
puts " "  # Adding a space here
reed
