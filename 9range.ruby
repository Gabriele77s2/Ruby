(10..1).to_a #=> []
(1...3) #=> [1, 2]
(-6..-1).to_a #=> [-6, -5, -4, -3, -2, -1]

('a'..'e').to_a #=> ["a", "b", "c", "d", "e"]
('a'...'e').to_a #=> ["a", "b", "c", "d"]

Range.new(1,3).to_a #=> [1, 2, 3]
Range.new(1,3,true).to_a#=> [1, 2]

# Iterating over a range
(1..5).each do |i|
   print i
end
# 12345

# Range between dates
require 'date'
date1 = Date.parse "01/06/2016"
date2 = Date.parse "05/06/2016"
p "Period #{date1.strftime("%d/%m/%Y")} to #{date2.strftime("%d/%m/%Y")}"

(date1..date2).each do |date|
   p date.strftime("%d/%m/%Y")
end
# "01/06/2016"
# "02/06/2016"
# "03/06/2016"
# "04/06/2016"
# "05/06/2016"

# Groups, named and otherwise
if match_data.nil? #Always check for nil! Common error.
   puts "No match"
else
   match[0] #=> "Hi, my name is Zaphod Beeblebrox"
   match[1] #=> "i" #the first group, (i|ello)
   match[2] #=> "Zaphod Beeblebrox"
   #Because it was a named group, we can get it by name
   match[:name] #=> "Zaphod Beeblebrox"
   match["name"] #=> "Zaphod Beeblebrox"
   puts "Hello #{match[:name]}!"
end

reg = /(((a)b)c)(d)/
match = reg.match 'abcd'
match[0] #=> "abcd"
match[1] #=> "abc"
match[2] #=> "ab"
match[3] #=> "a"
match[4] #=> "d"

# Common quick usage
string = "My not so long string"
string[/so/] # so
string[/present/] # nil
string[/present/].nil? # true

# Character classes
/[abc]/ # 'a' or 'b' or 'c'
/[a-z]/ # from 'a' to 'z'
/[a-cz]/ # 'a' or 'b' or 'c' or 'z'
/[-a-c]/ # '-' or 'a' or 'b' or 'c'
/[^a-c]/ # Not 'a', 'b' or 'c'

# Destructuring
a, b = [0,1] # a = 0, b = 1
a, *rest = [0,1,2,3] # a = 0, rest = [1,2,3]
a, * = [0,1,2,3] # a = 0   # Equivalent to .first
*, z = [0,1,2,3] # z = 3   # Equivalent to .last

triples = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
triples.each { |(first, second, third)| puts second }
# 2
# 5
# 8
triples.map { |(first, *rest)| rest.join(' ') } # => ["2 3", "5 6", "8 9"]

# Struct
# Creating new structures for data
Person = Struct.new :first_name, :last_name
person = Person.new 'John', 'Doe'
# => #<struct Person first_name="John", last_name="Doe">
person.first_name
# => "John"
person.last_name
# => "Doe"

# Customizing a structure class
Person = Struct.new :name do
def greet(someone)
   "Hello #{someone}! I am #{name}!"
   end
end
Person.new('Alice').greet 'Bob'
# => "Hello Bob! I am Alice!"

# Attribute lookup
Person = Struct.new :name
alice = Person.new 'Alice'
alice['name'] # => "Alice"
alice[:name] # => "Alice"
alice[0] # => "Alice"

# Keyword Arguments
def say(**args)
   puts args
end
say foo: "1", bar: "2"
# {:foo=>"1", :bar=>"2"}

def say(**args)
   puts args[:message] || "Message not found"
end
say foo: "1", bar: "2", message: "Hello World"
# Hello World
say foo: "1", bar: "2"
# Message not found

def say(message: nil, before: "<p>", after: "</p>")
   puts "#{before}#{message}#{after}"
end
args = { message: "Hello World", after: "</p><hr>" }
say(**args)
# <p>Hello World</p><hr>
args = { message: "Hello World", foo: "1" }
say(**args)
# => ArgumentError: unknown keyword: foo

def inner(foo:, bar:)
   puts foo, bar
end
def outer(something, foo: nil, bar: nil, baz: nil)
   puts something
   params = {}
   params[:foo] = foo || "Default foo"
   params[:bar] = bar || "Default bar"
   inner(**params)
end
outer "Hello:", foo: "Custom foo"
# Hello:
# Custom foo
# Default bar

# Using keyword arguments
def say(message: "Hello World")
   puts message
end
say
# => "Hello World"
say message: "Today is Monday"
# => "Today is Monday"
# you can define multiple keyword arguments, the definition order is irrelevant:
def say(message: "Hello World", before: "<p>", after: "</p>")
   puts "#{before}#{message}#{after}"
end
say
# => "<p>Hello World</p>"
say message: "Today is Monday"
# => "<p>Today is Monday</p>"
say after: "</p><hr>", message: "Today is Monday"
# => "<p>Today is Monday</p><hr>"
# keyword arguments can be mixed with positional arguments:
def say(message, before: "<p>", after: "</p>")
   puts "#{before}#{message}#{after}"
end
say "Hello World", before: "<span>", after: "</span>"
# => "<span>Hello World</span>"

def say(message, options = {})
   before = option.fetch(:before, "<p>")
   after = option.fetch(:after, "</p>")
   puts "#{before}#{message}#{after}"
end
# the method call is syntactically equivalent to the keyword argument one
say "Hello World", before: "<span>", after: "</span>"
# => "<span>Hello World</span>"
# note that trying to pass a not-defined keyword argument will result in an error:
def say(message: "Hello World")
   puts message
end
say foo: "Hello"
# => ArgumentError: unknown keyword: foo

# Required keyword arguments
def say(message:)
   puts message
end
say
# => ArgumentError: missing keyword: message
say message: "Hello World"
# => "Hello World"

def say(before: "<p>", message:, after: "</p>")
   puts "#{before}#{message}#{after}"
end
say
# => ArgumentError: missing keyword: message
say message: "Hello World"
# => "<p>Hello World</p>"
say message: "Hello World", before: "<span>", after: "</span>"
# => "<span>Hello World</span>"
