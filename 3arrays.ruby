# Create Array of Strings
array = %w(one two three four)
array = ['one', 'two', 'three', 'four']

var = 'hello'
%w(#{var}) # => ["\#{var}"]
%W(#{var}) # => ["hello"]
%w(Colorado California New\ York) # => ["Colorado", "California", "New York"]

# Create Array with Array::new
Array.new 3, :x            #=> [:x, :x, :x]
Array.new(3) { |i| i.to_s } #=> ["0", "1", "2"]
a = Array.new 3, "X"       # Not recommended.
a[1].replace "C"           # a => ["C", "C", "C"]
b = Array.new(3) { "X" }   # The recommended way.
b[1].replace "C"           # b => ["X", "C", "X"]

# Create Array of Symbols
array = %i(one two three four)
# Instead of %i(...) , you may use %i{...} or %i[...] or %i!...!
a = 'hello'
b = 'goodbye'
array_one = %I(#{a} #{b} world)
array_two = %i(#{a} #{b} world)

# Manipulating Array Elements
# Adding elements
[1, 2, 3] << 4
# => [1, 2, 3, 4]
[1, 2, 3].push(4)
# => [1, 2, 3, 4]
[1, 2, 3].unshift(4)
# => [4, 1, 2, 3]
[1, 2, 3] << [4, 5]
# => [1, 2, 3, [4, 5]]

# Removing elements
array = [1, 2, 3, 4]
array.pop
# => 4
array
# => [1, 2, 3]
array = [1, 2, 3, 4]
array.shift
# => 1
array
# => [2, 3, 4]
array = [1, 2, 3, 4]
array.delete(1)
# => 1
array
# => [2, 3, 4]
array = [1,2,3,4,5,6]
array.delete_at(2) // delete from index 2
# => 3
array
# => [1,2,4,5,6]
array = [1, 2, 2, 2, 3]
array - [2]
# => [1, 3] # removed all the 2s
array - [2, 3, 4]
# => [1] # the 4 did nothing

# Combining arrays
[1, 2, 3] + [4, 5, 6]
# => [1, 2, 3, 4, 5, 6]
[1, 2, 3].concat([4, 5, 6])
# => [1, 2, 3, 4, 5, 6]
[1, 2, 3, 4, 5, 6] - [2, 3]
# => [1, 4, 5, 6]
[1, 2, 3] | [2, 3, 4]
# => [1, 2, 3, 4]
[1, 2, 3] & [3, 4]
# => [3]

# You can also multiply arrays
[1, 2, 3] * 2
# => [1, 2, 3, 1, 2, 3]

# Accessing elements
%w(a b c)[0] # => 'a'
%w(a b c)[1] # => 'b'
%w(a b c d)[1..2] # => ['b', 'c'] (indices from 1 to 2, including the 2)
%w(a b c d)[1...2] # => ['b'] (indices from 1 to 2, excluding the 2)
%w(a b c)[-1] # => 'c'
%w(a b c)[-2] # => 'b'
%w(a b c d e)[1...-1] # => ['b', 'c', 'd']

[1, 2, 3, 4].first # => 1
[1, 2, 3, 4].first(2) # => [1, 2]
[1, 2, 3, 4].last # => 4
[1, 2, 3, 4].last(2) # => [3, 4]
# Random
[1, 2, 3, 4].sample # => 3
[1, 2, 3, 4].sample # => 1
[1, 2, 3, 4].sample(2) # => [2, 1]
[1, 2, 3, 4].sample(2) # => [3, 4]

# Creating an Array with the literal constructor [ ]
array = [1, 2, 3, 4]
array = [1, 'b', nil, [3, 4]]

# Decomposition
arr = [1, 2, 3]
a = arr[0]
b = arr[1]
c = arr[2]
a, b, c = arr

a, *b = arr # a = 1; b = [2, 3]
a, *b, c = arr # a = 1; b = [2]; c = 3
a, b, c, *d = arr # a = 1; b = 2; c = 3; d = []
a, *b, *c = arr # SyntaxError: unexpected *

a, b, c, d = arr # a = 1; b = 2; c = 3; d = nil

class Foo
   def to_ary
      [1, 2]
   end
end
a, b = Foo.new # a = 1; b = 2

1.respond_to?(:to_ary) # => false
a, b = 1 # a = 1; b = nil

arr = [1, [2, 3, 4], 5, 6]
a, (b, *c), *d = arr # a = 1; b = 2; c = [3, 4]; d = [5, 6]
# the same thing
a, b = [1, 2]
(a, b) = [1, 2]
a, b = 1, 2

# Arrays union, intersection and dierence
x = [5, 5, 1, 3]
y = [5, 2, 4, 3]
x | y
# => [5, 1, 3, 2, 4]
x & y
# => [5, 3]
x - y
# => [1]

# Remove all nil elements from an array with #compact
array = [ 1, nil, 'hello', nil, '5', 33]
array.compact # => [ 1, 'hello', '5', 33]
#notice that the method returns a new copy of the array with nil removed,
#without affecting the original
array = [ 1, nil, 'hello', nil, '5', 33]
#If you need the original array modified, you can either reassign it
array = array.compact # => [ 1, 'hello', '5', 33]
array = [ 1, 'hello', '5', 33]
#Or you can use the much more elegant 'bang' version of the method
array = [ 1, nil, 'hello', nil, '5', 33]
array.compact # => [ 1, 'hello', '5', 33]
array = [ 1, 'hello', '5', 33]
# if #compact or #compact! are called on an array with no nil elements, these will return nil.
array = [ 'foo', 4, 'life']
array.compact # => nil
array.compact! # => nil

# Get all combinations / permutations of an array
[1,2,3].permutation           # <Enumerator: [1,2,3]:permutation
[1,2,3].permutation.to_a      # [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
[1,2,3].permutation(2).to_a   # [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
[1,2,3].permutation(4).to_a [] # No permutations of length 4

[1,2,3].combination(1)        #<Enumerator: [1,2,3]:combination
[1,2,3].combination(1).to_a   # [[1],[2],[3]]
[1,2,3].combination(3).to_a   # [[1,2,3]]
[1,2,3].combination(4).to_a [] # No combinations of length 4

[1,2,3].combination(3).to_a.length           # 1
[1,2,3].repeated_combination(3).to_a.length  # 6
[1,2,3,4,5].combination(5).to_a.length       # 1
[1,2,3].repeated_combination(5).to_a.length  # 126

# Inject, reduce
[1,2,3].reduce(0) {|a,b| a + b} # => 6
[1,2,3].reduce {|a,b| a + b} # => 6
[1,2,3].reduce(0, :+) # => 6
[1,2,3].reduce(:+) # => 6

# Filtering arrays
array = [1, 2, 3, 4, 5, 6]
array.select { |number| number > 3 } # => [4, 5, 6]

array = [1, 2, 3, 4, 5, 6]
array.reject { |number| number > 3 } # => [1, 2, 3]

array = [1, 2, 3, 4, 5, 6]
array.select { |number| number > 3 }.reject { |number| number < 5 }
# => [5, 6]

# Map
[1, 2, 3].map { |i| i * 3 }
# => [3, 6, 9]
['1', '2', '3', '4', '5'].map { |i| i.to_i }
# => [1, 2, 3, 4, 5]
# call to_i method on all elements
%w(1 2 3 4 5 6 7 8 9 10).map(&:to_i)
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# using proc (lambda) on all elements
%w(1 2 3 4 5 6 7 8 9 10).map(&->(i){ i.to_i * 2})
# => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# Arrays and the splat (*) operator
def wrap_in_array(value)
   [*value]
end
wrap_in_array(1)
#> [1]
wrap_in_array([1, 2, 3])
#> [1, 2, 3]
wrap_in_array(nil)
#> []

def list(*values)
   values.each do |value|
      # do something with value
      puts value
   end
end
list(100)
#> 100
list([100, 200])
#> 100
#> 200
list(nil)
# nothing is outputted

# Two-dimensional array
array = Array.new(3) { Array.new(4) { 0 } }
# [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

x = array[0][1]
array[2][3] = 2

# Turn multi-dimensional array into a one-dimensional (flattened) array
[1, 2, [[3, 4], [5]], 6].flatten # => [1, 2, 3, 4, 5, 6]

# Get unique array elements
a = [1, 1, 2, 3, 4, 4, 5]
a.uniq
#=> [1, 2, 3, 4, 5]
a
#=> [1, 1, 2, 3, 4, 4, 5]
a.uniq!
#=> [1, 2, 3, 4, 5]
a
#=> [1, 2, 3, 4, 5]

# Create Array of numbers
numbers = [1, 2, 3, 4, 5]
numbers = Array(1..10) # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers = (1..10).to_a # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odd_numbers = (1..10).step(2).to_a # => [1, 3, 5, 7, 9]
even_numbers = 2.step(10, 2).to_a # => [2, 4, 6, 8, 10]

squared_numbers = (1..10).map { |number| number * number } # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

number_generator = (1..100).lazy # => #<Enumerator::Lazy: 1..100>
number_generator.first(10) # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Create an Array of consecutive numbers or letters
(1..10).to_a #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a_range = 1...5
a_range.to_a #=> [1, 2, 3, 4]

('a'..'f').to_a #=> ["a", "b", "c", "d", "e", "f"]
('a'...'f').to_a #=> ["a", "b", "c", "d", "e"]

[*1..10] #=> [1,2,3,4,5,6,7,8,9,10]
[*'a'..'f'] #=> ["a", "b", "c", "d", "e", "f"]

# Cast to Array from any object
Array('something') #=> ["something"]
Array([2, 1, 5])  #=> [2, 1, 5]
Array(1) #=> [1]
Array(2..4) #=> [2, 3, 4]
Array([]) #=> []
Array(nil) #=> []
# you could replace join_as_string method from the following code ...
def join_as_string(arg)
   if arg.instance_of?(Array)
      arg.join(',')
   elsif arg.instance_of?(Range)
      arg.to_a.join(',')
   else
      arg.to_s
   end
end
join_as_string('something') #=> "something"
join_as_string([2, 1, 5]) #=> "2,1,5"
join_as_string(1) #=> "1"
join_as_string(2..4) #=> "2,3,4"
join_as_string([]) #=> ""
join_as_string(nil) #=> ""
# ... to the following code
def join_as_string(arg)
   Array(arg).join(',')
end

# Initializing a 2D array
my_array = [
   [1, 1, 2, 3, 5, 8, 13],
   [1, 4, 9, 16, 25, 36, 49, 64, 81],
   [2, 3, 5, 7, 11, 13, 17]
]

# Initializing a 3D array
my_array = [
   [
      [1, 1, 2, 3, 5, 8, 13],
      [1, 4, 9, 16, 25, 36, 49, 64, 81],
      [2, 3, 5, 7, 11, 13, 17]
   ],
   [
      ['a', 'b', 'c', 'd', 'e'],
      ['z', 'y', 'x', 'w', 'v']
   ],
   [
      []
   ]
]

# Accessing a nested array
my_array[1][2]

# Array flattening
my_array = [[1, 2], ['a', 'b']]
my_array.flatten
# [1, 2, 'a', 'b']
