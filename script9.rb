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