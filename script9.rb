#
# By convention, class names start with a capital letter and use CamelCase instead of relying_on_underscores.
# The difference between classes and objects. An object is a unit of data. A class is what kind of data it is.
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

# How to check class hierarchy
s = String.new("foobar")
"foobar"
s.class
# Find the class of s.
String
s.class.superclass
# Find the superclass of String.
Object
s.class.superclass.superclass # Ruby 1.9 uses a new BasicObject base class
BasicObject
s.class.superclass.superclass.superclass
nil


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

# Demo of how we're trying to get Dragon to inherit from Creature and Person. We'll get a superclass 
# mismatch for class Dragon error if we try this.
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

#
# IMPLICIT INHERITENCE
#
class Parent

  def implicit()
    puts "PARENT implicit()"
  end
end

class Child < Parent
end

dad = Parent.new()
son = Child.new()

dad.implicit()
son.implicit()

# Output =>  PARENT implicit()
#            PARENT implicit()



# EXPLICID INHERITENCE w/override
# This is an example of how the override behavior works.
# it runs the Parent.override function because that variable (dad) is a Parent. 
# But when line 15 runs it prints out the Child.override messages
# because son is an instance of Child and Child overrides that function 
# by defining its own version.
#
class Parent

  def override()
    puts "PARENT override()"
  end
end

class Child < Parent
  def override()
    puts "CHILD override()"
  end
end

dad = Parent.new()
son = Child.new()

dad.override()
son.override()

# Output =>  PARENT override()
#            CHILD override()

# SUPER()
# Example using super() which reaches into the Parent class
#
class Parent
  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent
  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super()
    puts "CHILD, AFTER PARENT altered()"
  end

end

dad = Parent.new()
son = Child.new()

dad.altered()
son.altered()

# Output =>  PARENT altered()
#            CHILD, BEFORE PARENT altered()
#            PARENT altered()
#            CHILD, AFTER PARENT altered()


# The most common use of super() is actually in initialize functions in base classes. 
# This is usually the only place where you need to do some things in a child, then complete the 
# initialization in the parent. 
# In this case, we are setting some variables in the initialize before having the Parent initialize with its Parent.initialize.
# Here's a quick example of doing that in the Child:
class Child < Parent
    def initialize(stuff)
        @stuff = stuff
        super()
    end
end


#
# In this code I'm not using the name Parent, since there is not a parent-child is-a relationship. 
# This is a "has-a" relationship, where Child has-a Other that it uses to get its work done.
#
class Other

  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

  def altered()
    puts "OTHER altered()"
  end
end

class Child

  def initialize()
    @other = Other.new()  # Notice we are initializing the "Other" class here to be implicit.
  end

  def implicit()
    @other.implicit()
  end

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    @other.altered()
    puts "CHILD, AFTER OTHER altered()"
  end
end

son = Child.new()

son.implicit()
son.override()
son.altered()

# OTHER implicit()
# CHILD override()
# CHILD, BEFORE OTHER altered()
# OTHER altered()
# CHILD, AFTER OTHER altered()


