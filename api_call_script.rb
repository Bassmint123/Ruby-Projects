# This is an API call to placekitten.
require 'open-uri'

kittens = open('http://placekitten.com/200/300')

f = File.open('kittens.jpg', 'w')
kittens.each do |kitten|
  f.write(kitten)
end

f.close

# API to call placekitten image
require 'open-uri'

kittens = open('http://placekitten.com/')
body = kittens.read[559, 441]
puts body

# If we want to just check the status
require 'open-uri'

placekitten = open('http://placekitten.com/')

puts placekitten.status # shows the response status (ie. 100, 200, 300, 400 or 500 )



=begin
The number of HTTP methods you'll use is quite small—there are just four HTTP "verbs" you'll need to know! They are:

-- The GPPD --
GET: retrieves information from the specified source.
POST: sends new information to the specified source.
PUT: updates existing information of the specified source.
DELETE: removes existing information from the specified source.

An HTTP request is made up of three parts:

The request line, which tells the server what kind of request is being sent (GET, POST, etc.) and what resource it's looking for;
The header, which sends the server additional information (such as which client is making the request)
The body, which can be empty (as in a GET request) or contain data (if you're POSTing or PUTing information, that information is contained here).

=end

# POST /codecademy/learn-http HTTP/1.1
# Host: www.codecademy.com
# Content-Type: text/html; charset=UTF-8

# Name=Eric&Age=26

# Check out the code below. We've required in the 'rexml/document' module for 
# parsing XML, and we're just using File.open to read from pets.txt (under the "Files") tab. 
# Reading from this file is just like reading XML sent by a server.
require "rexml/document"

file = File.open("pets.txt")
doc = REXML::Document.new file
file.close

doc.elements.each("pets/pet/name") do |element|
  puts element
end

# Here we've required the 'json' module for parsing JSON, and 
# we're using File.open as before to read from pets.txt (under the "Files") tab. 
# Reading from this file is just like reading JSON sent by a server.

require 'json'

pets = File.open("petsjson.txt", "r")

doc = ""
pets.each do |line|
  doc << line
end
pets.close

puts JSON.parse(doc)


