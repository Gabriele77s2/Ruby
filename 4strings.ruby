# Difference between single-quoted and double-quoted String literals
# Single-quoted strings don't support interpolation
puts 'Now is #{Time.now}'
# Now is #{Time.now}
# Double-quoted strings support interpolation
puts "Now is #{Time.now}"
# Now is 2016-07-21 12:43:04 +0200

puts 'Hello\nWorld'
# Hello\nWorld
puts "Hello\nWorld"
# Hello
# World

# Creating a String
s1 = 'Hello'
s2 = "Hello"

%(A string)
%{A string}
%<A string>
%|A string|
%!A string!

puts %q(A string)
# A string
puts %q(Now is #{Time.now})
# Now is #{Time.now}
puts %Q(A string)
# A string
puts %Q(Now is #{Time.now})
# Now is 2016-07-21 12:47:45 +0200

# Case manipulation
"string".upcase # => "STRING"
"STRING".downcase # => "string"
"String".swapcase # => "sTRING"
"string".capitalize # => "String"

str = "Hello"
str.upcase # => "HELLO"
puts str # => "Hello"

"string".upcase! # => "STRING"
"STRING".downcase! # => "string"
"String".swapcase! # => "sTRING"
"string".capitalize! # => "String"

str = "Hello"
str.upcase! # => "HELLO"
puts str # => "HELLO"

# String concatenation
s1 = "Hello"
s2 = " "
s3 = "World"
puts s1 + s2 + s3
# => Hello World
s = s1 + s2 + s3
puts s
# => Hello World

s = 'Hello'
s << ' '
s << 'World'
puts s
# => Hello World

"wow" * 3
# => "wowwowwow"

# Positioning strings
str ="abcd"
str.ljust(4)  # => "abcd"
str.ljust(10) # => "abcd

str = "abcd"
str.rjust(4)  # => "abcd"
str.rjust(10) # => "      abcd"

str = "abcd"
str.center(4)  # => "abcd"
str.center(10) # => "   abcd   "

# Splitting a String
"alpha,beta".split(",")
# => ["alpha", "beta"]
"".split(",")
# => []
"alpha,beta".split(".")
# => ["alpha,beta"]
"alpha, beta,gamma".split(/, ?/)
# => ["alpha", "beta", "gamma"]
"alpha beta".split
# => ["alpha", "beta"]

# String starts with
str = "zebras are cool"
str.start_with?("zebras") # => true
str.index("zebras").zero? # => true

# Joining Strings
["alpha", "beta"].join(",")
# => "alpha,beta"
["alpha", "beta"].join
# => "alphabeta"
[].join(",")
# => ""

# String interpolation
puts "Now is #{Time.now}"
# Now is Now is 2016-07-21 12:47:45 +0200
puts %Q(Now is #{Time.now})
# Now is Now is 2016-07-21 12:47:45 +0200

# String ends with
str = "I like pineapples"
str.end_with?("pineaaples") # => false

# Formatted strings
"Hello %s, my name is %s!" % ['World', 'br3nt']
# => Hello World, my name is br3nt!

# String Substitution
p "This is %s" % "foo"
# => "This is foo"
p "%s %s %s" % ["foo", "bar", "baz"]
# => "foo bar baz"
p "%{foo} == %{foo}" % {:foo => "foo" }
# => "foo == foo"

# Multiline strings
address = "Four score and seven years ago our fathers brought forth on this
continent, a new nation, conceived in Liberty, and dedicated to the
proposition that all men are created equal."

# String character replacements
"string".tr('r', 'l') # => "stling"
"string ring".sub('r', 'l') # => "stling ring"
"string ring".gsub('r','l') # => "stling ling"
