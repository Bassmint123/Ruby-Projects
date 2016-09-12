#
# By convention, class names start with a capital letter and use CamelCase instead of relyingonunderscores.
# In Ruby, we use @ before a variable to signify that it's an instance variable. This means that the 
# variable is attached to the instance of the class. 
#
class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end
	
  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description

# Output => I'm Ruby and I was created by Yukihiro Matsumoto!
#           I'm Python and I was created by Guido van Rossum!
#           I'm JavaScript and I was created by Brendan Eich!

###############################################
#
# In working with scope, the following applies: 
#   $ is for global variables, 
#   @ is for instance variables
#   @@ is for class variables
#
# Global variables can be declared in two ways: 
# 1. Use the @ to define the variable outside of any method or class, and voilà! It's global. 
# 2. If you want to make a variable global from inside a method or class, just start it with a $, like so: $matz.
#
#
class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def current_user
    @username
  end
  
  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.

# Output => 
#           Current user: Dave
#           Manufacturer: Mango Computer, Inc.
#           Files: {:hello=>"Hello, world!"}

#
# Demostration of a class variable
#
class Person
  # Set class variable to 0
  @@people_count = 0
  
  def initialize(name)
    @name = name
    # Increment class variable
    @@people_count += 1
  end
  
  def self.number_of_instances
    # Return class variable
    @@people_count 
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}"

# Output => 2

#
# Example of inheritence. The SuperBadError Class inherits from the ApplicationError Class
#
class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

#
# Example of overriding. In this case, the fight method in Dragon 
# overrides the fight method in Creature
#
class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end

class Dragon < Creature
   def fight
      "Breathes fire!"  # return a string 
   end 
end

#
# Format for using attributes of methods of a super class. In this case,
# super would use something from the class Base, as Base is the super class
# of DerivedClass
#
class DerivedClass < Base
  def some_method
    super(optional args)
      # Some stuff
    end
  end
end

#
#  if you want to end a Ruby statement without going to a new line, you can just type a semicolon. This means you can write something like
#
# class Monkey
# end
# on just one line: 
class Monkey; end. 
#This is a time saver when you're writing something very short, like an empty class or method definition.

# Demo of how we're trying to get Dragon to inherit from Creature and Person. We'll get a superclass mismatch for class Dragon error if we try this.
class Creature
  def initialize(name)
    @name = name
  end
end

class Person
  def initialize(name)
    @name = name
  end
end

class Dragon < Creature; end
class Dragon < Person; end  # Creates and error





