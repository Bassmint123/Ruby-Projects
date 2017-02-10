class Machine
  @@users = {}
  
  def initialize(username, password)
    @username = username
    @password = password
	# so that our @@users hash keeps usernames as keys with 
    # each username's password as the associated value.
    @@users[username] = password
    @files = {}
  end
  
  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end
  
  # This is notation for a class method. It has the class name with it.
  def Machine.get_users 
    @@users    # return @@users
  end
end

my_machine = Machine.new("eric", 01234)
your_machine = Machine.new("you", 56789)

my_machine.create("groceries.txt")
your_machine.create("todo.txt")

puts "Users: #{Machine.get_users}"

# Output =>
# groceries.txt was created by eric at 2016-09-12 02:31:43 +0000.
# todo.txt was created by you at 2016-09-12 02:31:43 +0000.
# Users: {"eric"=>668, "you"=>56789}

###########################
# Ruby allows you to explicitly make some methods public and others private. 
# Public methods allow for an interface with the rest of the program; 
# they say, "Hey! Ask me if you need to know something about my class or its instances."
#
# Private methods, on the other hand, are for your classes to do their own work undisturbed. 
# They don't want anyone asking them anything, so they make themselves unreachable!
#
# Check out what happens when we try to call bank_account_number, which is a private method.
#
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  public    # This method can be called from outside the class.
  
  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end
  
  private   # This method can't!
  
  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end
end

eric = Person.new("Eric", 26)
eric.about_me
eric.bank_account_number

# Output =>
# I'm Eric and I'm 26 years old!
# private method `bank_account_number' called for #<Context::Person:0x00000000e690d8 @name="Eric", @age=26>
#

#
# Using the semicolon with the declarations to write our empty method definitions on one line.
# With a private method we can only call these methods from other code inside
# the object. Another way to say this is that the method cannot be called with an "explicit receiver".
# 
class ClassName
  # Some class stuff

  public
  # Public methods go here
  def public_method; end

  private
  # Private methods go here
  def private_method; end
end

#
# Example using attr_reader and attr_writer
#
class Person
   
  attr_reader :name
  attr_writer :job

 # With the attr_reader and attr_writer statements, we no
 # longer need the following code:
 #
 # def initialize(name, job)
 #   @name = name
 #   @job = job
 # end
 #
 # def name
 #   @name
 # end
 # 
 # def job=(new_job)
 #   @job = new_job
 # end
 # 
end

#
# OR instead of using attr_reader and attr_writer, we can use the "attr_accessor" to make 
# a variable readable and writeable in one fell swoop.
# 
lass Person
  attr_reader :name
  attr_accessor :job
  
  def initialize(name, job)
    @name = name
    @job = job
  end
end

#
# Example using a module. They are mostly used for storage. They do not work like a class.
# Modules are good for carrying constants (namespaces)
# Modules can add state to an existing class.
# Modules can have static methods
# Modules can act as namespaces
#
module Circle   # Modules are written in CamelCase

  PI = 3.141592653589793
  
  def Circle.area(radius)
    PI * radius**2
  end
  
  def Circle.circumference(radius)
    2 * PI * radius
  end
end

#
# One of the main purposes of modules is to separate methods and constants into named spaces. 
# This is called (conveniently enough) namespacing, and it's how Ruby doesn't confuse Math::PI and Circle::PI.
#
# The double colon is called the scope resolution operator, which is a fancy way of 
# saying it tells Ruby where you're looking for a specific bit of code. 
# If we say Math::PI, Ruby knows to look inside the Math module to get that PI, 
# not any other PI (such as the one we created in Circle).
#
module Math
   PI
 end
  
 puts Math::PI
 
# Output => 3.141592653589793

# Example of unary operator constant defined on main Object class
module Foo
  MR_COUNT = 2
  ::MR_COUNT = 1    # set global count to 1
end

puts MR_COUNT       # this is the global constant
puts Foo::MR_COUNT  # this is the local "Foo" constant


#
# Some modules, like Math, are already present in the interpreter. Others need to be explicitly brought in, 
# however, and we can do this using "require". We can do this simply by typing the following:  require 'module'
#
require 'date'

puts Date.today

# Output => Whatever today's date is.


=begin
We can do more than just require a module, however. We can also include it!
Any class that includes a certain module can use those module's methods!
A nice effect of this is that you no longer have to prepend your constants and methods with 
the module name. Since everything has been pulled in, you can simply write PI instead of Math::PI.

The scoop on require vs. include 
The Ruby include statement simply makes a reference to a module. If that module is in a separate file, 
you must use require (or its less commonly used cousin, load) to drag that file in before using include.
=end
class Angle
  include Math
  attr_accessor :radians
  
  def initialize(radians)
    @radians = radians
  end
  
  def cosine
    cos(@radians)
  end
end

acute = Angle.new(1)
acute.cosine

# Mixin
# When a module is used to mix additional behavior and information into a class, it's called a mixin. 
# Mixins allow us to customize a class without having to rewrite code!

module Action
  def jump
    @distance = rand(4) + 2  
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
jiminy.jump

# Output =>
# I jumped forward 5 feet!
# I jumped forward 2 feet!


#
# extend
#
# Whereas include mixes a module's methods in at the instance level (allowing instances of a particular class to use the methods), 
# the extend keyword mixes a module's methods at the class level. This means that class itself can use the methods, 
# as opposed to instances of the class.
#
# ThePresent has a .now method that we'll extend to TheHereAnd

module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now

# Output => It's 4:16 AM (GMT). 
