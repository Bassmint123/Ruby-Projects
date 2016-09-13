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




