@arr = [1,2,3,4]
puts @arr.inspect # output is [1,2,3,4]
print "Reversed array elements["
   @arr.reverse_each do |val|
      print " #{val} " # output is 4 3 2 1
   end
   print "]\n"

# Implementation in a class
class NaturalNumbers
   include Enumerable
   def initialize(upper_limit)
      @upper_limit = upper_limit
   end
   def each(&block)
      0.upto(@upper_limit).each(&block)
   end
end
n = NaturalNumbers.new(6)
n.reduce(:+) # => 21
n.select(&:even?) # => [0, 2, 4, 6]
n.map { |number| number ** 2 } # => [0, 1, 4, 9, 16, 25, 36]

# Iterating over complex objects
# arrays
[[1, 2], [3, 4]].each { |(a, b)| p "a: #{ a }", "b: #{ b }" }
[[1, 2], [3, 4]].each { |a, b| "a: #{ a }", "b: #{ b }" }
# "a: 1"
# "b: 2"
# "a: 3"
# "b: 4"

# hashes
{a: 1, b: 2, c: 3}.each { |pair| p "pair: #{ pair }" }
# "pair: [:a, 1]"
# "pair: [:b, 2]"
# "pair: [:c, 3]"

{a: 1, b: 2, c: 3}.each { |(k, v)| p "k: #{ k }", "v: #{ k }" }
# "k: a"
# "v: a"
# "k: b"
# "v: b"
# "k: c"
# "v: c"

# For iterator
for i in 4..13
   puts "this is #{i}.th number"
end

names = ['Siva', 'Charan', 'Naresh', 'Manish']
for name in names
   puts name
end

# Iteration with index
[2,3,4].map.with_index { |e, i| puts "Element of array number #{i} => #{e}" }
#Element of array number 0 => 2
#Element of array number 1 => 3
#Element of array number 2 => 4
#=> [nil, nil, nil]

[2,3,4].map.with_index(1) { |e, i| puts "Element of array number #{i} => #{e}" }
#Element of array number 1 => 2
#Element of array number 2 => 3
#Element of array number 3 => 4
#=> [nil, nil, nil]

[2,3,4].each_with_index { |e, i| puts "Element of array number #{i} => #{e}" }
#Element of array number 0 => 2
#Element of array number 1 => 3
#Element of array number 2 => 4
#=> [2, 3, 4]

# Map
arr = [1, 2, 3]
arr.map { |i| i + 1 } # => [2, 3, 4]
arr # => [1, 2, 3]

arr = [1, 2, 3]
arr.map! { |i| i + 1 } # => [2, 3, 4]
arr # => [2, 3, 4]
