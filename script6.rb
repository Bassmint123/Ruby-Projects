
# Using "to_sym" to convert each string into a symbol and push it into the symbols array
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

symbols = []
strings.each do |s|
     symbols.push(s.to_sym)
end

# Using intern to convert each string into a symbol and push it into the symbols array
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols = []
strings.each do |s|
     symbols.push(s.intern)
end

# Example of Hash Rocket notation
movies = {
    :Top_Gun => "A classic with Tom Cruise",
    :Gran_Torino => "A retired Dirty Harry"
}

# Same hash as above, but using the Ruby 1.9 syntax which no longer uses the Hash Rocket
# Rather, it now has only a space and the colon at the end of the symbol name
movies = {
    Top_Gun: "A classic with Tom Cruise",
    Gran_Torino: "A retired Dirty Harry"
}