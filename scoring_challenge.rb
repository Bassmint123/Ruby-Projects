=begin
Alice and Bob each created one problem for HackerRank. A reviewer rates the two challenges, awarding points on a scale from  to  for three categories: problem clarity, originality, and difficulty.

We define the rating for Alice's challenge to be the triplet , and the rating for Bob's challenge to be the triplet .

The task is to find their comparison scores by comparing a0, a1, and a2,  with b0, b1, and b2.

If ai > bi, then Alice is awarded  point.
If ai < bi, then Bob is awarded  point.
If ai = bi, then neither person receives a point.
Can we compare the two challenges and print their respective comparison points? ...that's the challenge.

Input Format
The first line contains 3 space-separated integers, a0, a1, and a2, describing the respective values in triplet . 
The second line contains 3 space-separated integers, b0, b1, and b2, describing the respective values in triplet .

Constraints
1 < or = ai < or = 100
1 < or = bi < or = 100

Print two space-separated integers denoting the respective comparison scores earned by Alice and Bob
=end
# Sample Input
# 5 6 7
# 3 6 10

# Sample Output
# 1 1 

a0,a1,a2 = gets.strip.split(' ')
a0 = a0.to_i.abs  # using the .abs function for absolute number
a1 = a1.to_i.abs
a2 = a2.to_i.abs
b0,b1,b2 = gets.strip.split(' ')
b0 = b0.to_i.abs
b1 = b1.to_i.abs
b2 = b2.to_i.abs

a0 > 100 ? a0 = 100 : a0 = a0
a1 > 100 ? a1 = 100 : a1 = a1 
a2 > 100 ? a2 = 100 : a2 = a2 
b0 > 100 ? b0 = 100 : b0 = b0  
b1 > 100 ? b1 = 100 : b1 = b1
b2 > 100 ? b2 = 100 : b2 = b2

a0 < 1 ? a0 = 1 : a0 = a0
a1 < 1 ? a1 = 1 : a1 = a1 
a2 < 1 ? a2 = 1 : a2 = a2 
b0 < 1 ? b0 = 1 : b0 = b0  
b1 < 1 ? b1 = 1 : b1 = b1
b2 < 1 ? b2 = 1 : b2 = b2

ascore = 0.to_i
bscore = 0.to_i
if a0 > b0
  ascore +=1
elsif a1 > b1
  ascore +=1
elsif a2 > b2
  ascore +=1
else
  ascore += 0
end

if a0 < b0
  bscore +=1
elsif a1 < b1
  bscore +=1
elsif a2 < b2
  bscore +=1
else
  bscore += 0
end

print "#{ascore} #{bscore}"



