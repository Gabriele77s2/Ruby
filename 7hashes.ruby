# Creating a hash
my_hash = {} # an empty hash
my_hash = Hash.new # any empty hash
grades = { 'Mark' => 15, 'Jimmy' => 10, 'Jack' => 10 }

mapping = { 'Mark' => 15, 'Jimmy' => [3,4], 'Nika' => {'a' => 3, 'b' => 5} }
mapping['Mark'] # => 15
mapping['Jimmy'] # => [3, 4]
mapping['Nika'] # => {"a"=>3, "b"=>5}
mapping = { 'Mark' => 15, 5 => 10, [1, 2] => 9 }
mapping['Mark'] # => 15
mapping[[1, 2]] # => 9

grades = { :Mark => 15, :Jimmy => 10, :Jack => 10 }
grades = { Mark: 15, Jimmy: 10, Jack: 10 }
grades = { "Mark" => 15, "Jimmy" => 10, "Jack" => 10 }
mapping = { :length => 45, width: 10 }
grades = { "Jimmy Choo": 10, :"Jack Sparrow": 10 }
# => { :"Jimmy Choo" => 10, :"Jack Sparrow" => 10}

# Setting Default Values
h = Hash.new(0)
h[:hi] = 1
puts h[:hi] # => 1
puts h[:bye] # => 0 returns default value instead of nil

my_hash = { human: 2, animal: 1 }
my_hash.default = 0
my_hash[:plant] # => 0

# Use an empty array as the default value
authors = Hash.new([])
# Append a book title
authors[:homer] << 'The Odyssey'
# All new keys map to a reference to the same array:
authors[:plato] # => ['The Odyssey']
authors = Hash.new { [] }
# Note that we're using += instead of <<, see below
authors[:homer] += ['The Odyssey']
authors[:plato] # => []
authors # => {:homer=>["The Odyssey"]}
authors[:homer] << 'The Odyssey' # ['The Odyssey']
authors[:homer] # => []
authors # => {}

authors = Hash.new { |hash, key| hash[key] = [] }
authors[:homer] << 'The Odyssey'
authors[:plato] # => []
authors # => {:homer=>["The Odyssey"], :plato=>[]}

chars = Hash.new { |hash,key| key.length }
chars[:test] # => 4

page_views = Hash.new { |hash, key| hash[key] = { count: 0, url: key } }
page_views["http://example.com"][:count] += 1
page_views # => {"http://example.com"=>{:count=>1, :url=>"http://example.com"}}

authors = {}
authors.default_proc = proc { [] }
authors[:homer] += ['The Odyssey']
authors[:plato] # => []
authors # {:homer=>["The Odyssey"]}

# Accessing Values
my_hash = { length: 4, width: 5 }
my_hash[:length] #=> => 4
my_hash[:height] = 9
my_hash #=> {:length => 4, :width => 5, :height => 9 }

my_hash = {}
my_hash[:age] # => nil

my_hash = { "name" => "user" }
my_hash[:name] # => nil
my_hash["name"] # => user

my_hash = {}
my_hash.fetch(:age) #=> KeyError: key not found: :age
my_hash = {}
my_hash.fetch(:age, 45) #=> => 45
my_hash = {}
my_hash.fetch(:age) { 21 } #=> 21
my_hash.fetch(:age) do |k|
   puts "Could not find #{k}"
end
#=> Could not find age

my_hash = {}
my_hash.store(:age, 45)
my_hash #=> { :age => 45 }

my_hash = { length: 4, width: 5 }
my_hash.values #=> [4, 5]

h = { foo: {bar: {baz: 1}}}
h.dig(:foo, :bar, :baz) # => 1
h.dig(:foo, :zot, :xyz) # => nil
g = { foo: [10, 11, 12] }
g.dig(:foo, 1) # => 11

# Automatically creating a Deep Hash
a = {}
p a[ :b ] # => nil

b = Hash.new 'puppy'
p b[ :b ] # => 'puppy'

# h is the hash you're creating, and k the key.
hash = Hash.new { |h, k| h[k] = Hash.new &h.default_proc }
hash[ :a ][ :b ][ :c ] = 3
p hash # => { a: { b: { c: 3 } } }

# Iterating Over a Hash
# .each and .each_pair iterate over each key-value pair:
h = { "first_name" => "John", "last_name" => "Doe" }
h.each do |key, value|
   puts "#{key} = #{value}"
end
# => first_name = John
# last_name = Doe

# .each_key iterates over the keys only:
h = { "first_name" => "John", "last_name" => "Doe" }
h.each_key do |key|
   puts key
end
# => first_name
# last_name
# .each_value iterates over the values only:
h = { "first_name" => "John", "last_name" => "Doe" }
h.each_value do |value|
   puts value
end
# => John
# Doe

# .each_with_index iterates over the elements and provides the index of the iteration:
h = { "first_name" => "John", "last_name" => "Doe" }
h.each_with_index do |(key, value), index|
   puts "index: #{index} | key: #{key} | value: #{value}"
end
# => index: 0 | key: first_name | value: John
# index: 1 | key: last_name | value: Doe

# Filtering hashes
{ :a => 1, :b => 2, :c => 3 }.select { |k, v| k != :a && v.even? } # => { :b => 2 }
# When you will not need the key or value in a filter block, the convention is to use an _ in that place:
{ :a => 1, :b => 2, :c => 3 }.select { |_, v| v.even? } # => { :b => 2 }
{ :a => 1, :b => 2, :c => 3 }.select { |k, _| k == :c } # => { :c => 3 }
# reject returns a new hash with key-value pairs for which the block evaluates to false :
{ :a => 1, :b => 2, :c => 3 }.reject { |_, v| v.even? } # => { :a => 1, :c => 3 }
{ :a => 1, :b => 2, :c => 3 }.reject { |k, _| k == :b } # => { :a => 1, :c => 3 }

# Conversion to and from Arrays
{ :a => 1, :b => 2 }.to_a # => [[:a, 1], [:b, 2]]

[[:x, 3], [:y, 4]].to_h # => { :x => 3, :y => 4 }

Hash[:a, 1, :b, 2] # => { :a => 1, :b => 2 }

Hash[ [[:x, 3], [:y, 4]] ] # => { :x => 3, :y => 4 }

{ :a => 1, :b => 2 }.flatten # => [:a, 1, :b, 2]

Hash[('a'..'z').collect{ |c| [c, c.upcase] }] # => { 'a' => 'A', 'b' => 'B', ... }

people = ['Alice', 'Bob', 'Eve']
height = [5.7, 6.0, 4.9]
Hash[people.zip(height)] # => { 'Alice' => 5.7, 'Bob' => '6.0', 'Eve' => 4.9 }

# Getting all keys or values of hash
{foo: 'bar', biz: 'baz'}.keys # => [:foo, :biz]
{foo: 'bar', biz: 'baz'}.values # => ["bar", "baz"]
{foo: 'bar', biz: 'baz'}.to_a # => [[:foo, "bar"], [:biz, "baz"]]
{foo: 'bar', biz: 'baz'}.each #<Enumerator: {:foo=>"bar", :biz=>"baz"}:each>

# Modifying keys and values
fruit = { name: 'apple', color: 'green', shape: 'round' }
# => {:name=>"apple", :color=>"green", :shape=>"round"}
new_fruit = fruit.inject({}) { |memo, (k,v)| memo[k.to_s] = v.upcase; memo }
# => new_fruit is {"name"=>"APPLE", "color"=>"GREEN", "shape"=>"ROUND"}

# Set Operations on Hashes
# Intersection of Hashes
hash1 = { :a => 1, :b => 2 }
hash2 = { :b => 2, :c => 3 }
hash1.select { |k, v| (hash2.include?(k) && hash2[k] == v) } # => { :b => 2 }
# Union (merge) of hashes:
hash1 = { :a => 1, :b => 2 }
hash2 = { :b => 4, :c => 3 }
hash1.merge(hash2) # => { :a => 1, :b => 4, :c => 3 }
hash2.merge(hash1) # => { :b => 2, :c => 3, :a => 1 }
