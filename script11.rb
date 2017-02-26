# As Ruby does not have an enum function built in, we have to roll our own.
# Here are two examples of enum.

# Create an enum with Color class
class Color
  BLUE=1
  RED=2
  GREEN=3
  YELLOW=4
  ORANGE=5
  PURPLE=6
end

def paint_the_car(color)
  puts color
end
 
paint_the_car(Color::YELLOW)


# If we want to iterate through every item like a collection
class Color 
    def Color.add_item(key,value)
        @hash ||= {}
        @hash[key]=value
    end
    
    def Color.const_missing(key)
        @hash[key]
    end    
    
    def Color.each
        @hash.each {|key,value| yield(key,value)}
    end
    
    Color.add_item :BLUE, 1
    Color.add_item :RED, 2
    Color.add_item :YELLOW, 3
end
 
#That's it! We can now use our enum :
my_color = Color::RED if some_condition
 
#And we can loop
Color.each do |key,value|
  do_something_with_value(value)
end
