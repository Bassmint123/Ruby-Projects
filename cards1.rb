=begin
 
 Author: Brad Beiermann
 email: bradb@cimstrat.com
 Date: March 24, 2017
 Program: cards1.rb
 Language: Ruby 2.3
 
 Description:
   This code was prepared as part of a requested 
   programming assignment for a company I interviewed at. 
   The problem relates to creating a Deck class that 
   generates a deck of cards that supports methods for: 
   shuffle, cut, draw and draw(n).

=end

#--------------------------------------
#  Class Declarations For: Card, Deck
#-------------------------------------- 

class Card
  attr_accessor :number, :suit, :cardvalue
 
  def initialize(number, suit, cardvalue)
    @suit = suit
    @cardvalue = cardvalue
    @number = number
  end
 
  def to_s
    "#{@number} of #{@suit}"
  end
end  # end of Card class

class Deck
  def initialize
    @cards = []
      ranks = %w{ 2 3 4 5 6 7 8 9 10 Jack Queen King Ace}
      suits = %w{Clubs Diamonds Hearts Spades}

      ranks.each do |rank|
        (suits.size).times do |i|
          @cards.push(Card.new(rank, suits[i], (i+1)))
        end
      end
    end
    
      
  # draw from the deck. (supports overloading)
  def draw(*args)
    if args.length == 1   # check for method "draw(n)" or method "draw"
      n = *args
      num = Integer(n.first)
      if num > 52 || num < 1
        puts "The draw amount needs to be between 1 to 52"
      else
        @cards[0..num-1]
      end
    else     
      @cards.shift  
    end
  end
    
  # shuffle the cards
  def shuffle
    @cards.shuffle!
  end
    
  # cut the deck.
  def cut
    deck2 = []
    deck1 = []
    deck1 = @cards[(@cards.length)/2..-1]
    deck2 = @cards[0...(@cards.length)/2]
    return @cards = deck1 + deck2
  end
end  # end of Deck class

#----------------------
# Program Operations
#----------------------

deck = Deck.new

puts "Cut the deck"
puts deck.cut
puts "\nShuffle the deck"
puts deck.shuffle
puts "\nDraw method with no parameters:"
puts deck.draw
puts "\nDraw method with parameters:"
puts deck.draw(3)











