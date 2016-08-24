def prime(n)
  puts "That's not an integer." unless n.is_a? Integer
  is_prime = true
  for i in 2..n-1
    if n % i == 0
      is_prime = false
    end
  end
  if is_prime
    puts "#{n} is prime!"
  else
    puts "#{n} is not prime."
  end
end

prime(2)
prime(9)
prime(11)
prime(51)
prime(97)

# Simple creation of method and calling it
def array_of_10
  puts (1..10).to_a
end

call array_of_10

# Testing out the splat feature of Ruby. It lets Ruby know
# the number of parameters being passed to a method is unknown
def what_up(greeting, *bros)
  bros.each { |bro| puts "#{greeting}, #{bro}!" }
end
 
what_up("What up", "Justin", "Ben", "Kevin Sorbo")

# The first method greeter returns a greeting with string parameter
# The second method by_three? checks if a number is evenly divisible by three or not
def greeter(name)
    return "Hello " + name
end

def by_three?(number)
    if number % 3 == 0
       return true
    else
       return false
    end
end

greeter("Brad")
by_three?(9)