# The balance=100 is signifying an optional parameter. Ruby is saying that you can pass one or two 
# arguments to initialize; if you pass two, it uses your balance argument to set @balance; 
# if you only pass a name, balance gets a default value of 100, and that's what gets stored in @balance.
#
# We used underscores in our 1_000_000 (one million). 
# Ruby allows this, and it makes it easier to read big numbers!

class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end
  
  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: $#{@balance}." : pin_error  # using terinary notation here for if-else flow control
  end
  
  def withdraw(pin_number, amount)
    if pin_number == pin
      @balance -= amount
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end
  
  private
  
  def pin
    @pin = 1234
  end
  
  def pin_error
    "Access denied: incorrect PIN."
  end
end

my_account = Account.new("Eric", 1_000_000)
my_account.withdraw(11, 500_000)
my_account.display_balance(1234)
my_account.withdraw(1234, 500_000)
my_account.display_balance(1234)

# Output =>
# Access denied: incorrect PIN.
# Balance: $1000000.
# Withdrew 500000. New balance: $500000.
# Balance: $500000.