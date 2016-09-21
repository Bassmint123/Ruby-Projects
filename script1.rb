# Doing some simple Ruby here
my_var = "Hello World"

# Arithmetic functions
my_answer = 3 * 2  # Output => 6
new_answer = 3 + my_answer # Output => 9
newer_answer = new_answer % 2  # Output => 1   Note: This 9 / 2 = 4 with remainder of 1


print "Hi everybody"
puts "Hi folks"
print "Do you like bacon?"

puts """If you use the triple quotes
you can print multiple lines
like this. This makes things a bit
more simple"""

puts "I am 6'2\" tall."  # escape double-quote inside string with a backslash
puts 'I am 6\'2" tall.'  # samething except with single quotes

puts tabby_cat = "\tI'm tabbed in"
puts persian_cat = "I'm split\non a line."
puts backslash_cat = "I'm \\ a \\ cat."   # Output => I'm \ a \ cat.

puts fat_cat = """
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""

=begin
Escape	What it does.
\\	Backslash ()
\'	Single-quote (')
\"	Double-quote (")
\a	ASCII bell (BEL)
\b	ASCII backspace (BS)
\f	ASCII formfeed (FF)
\n	ASCII linefeed (LF)
\r	ASCII Carriage Return (CR)
\t	ASCII Horizontal Tab (TAB)
\uxxxx	Character with 16-bit hex value xxxx (Unicode only)
\v	ASCII vertical tab (VT)
\ooo	Character with octal value ooo
\xhh	Character with hex value hh
=end


# Doing a method to count string length
"Brad Beiermann".length

# Doing a reverse method
"Brad Beiermann".reverse
# Output => nnamreieB darB

puts "Brad Beiermann".upcase  #converts to uppercase
puts "HOWDY Brad".downcase  #converts to lower case

=begin
A multi-line comment.
It can be many lines
as long as begin and end are in place
no space should be used in between begin and end
=end

# Chaining methods together
name = "Brad Beiermann"
puts name.downcase.reverse.upcase
# Output => DARB

# Now we can use the formatter feature
formatter = "%{first} %{second}"

puts formatter % {first: 1, second: 2}
puts formatter % {first: "one", second: "two"}
puts formatter % {first: true, second: false}
puts formatter % {first: formatter, second: formatter}

puts formatter % {
  first: "I had this thing",
  second: "and it became collectable."
}


