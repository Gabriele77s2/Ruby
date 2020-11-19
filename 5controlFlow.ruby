# if, elsif, else and end
result = [:heads, :tails].sample
if result == :heads
   puts 'The coin-toss came up "heads"'
else
   puts 'The coin-toss came up "tails"'
end

status = if age < 18
            :minor
         else
            :adult
         end

status = age < 18 ? :minor : :adult

label =  if shirt_size == :s
            'small'
         elsif shirt_size == :m
            'medium'
         elsif shirt_size == :l
            'large'
         else
            'unknown size'
         end

# Case statement
case x
when 1, 2, 3
   puts "1, 2, or 3"
when 10
   puts "10"
else
   puts "Some other number"
end

case x
when 1, 2, 3 then puts "1, 2, or 3"
when 10 then puts "10"
else puts "Some other number"
end

case 17
when 13..19
   puts "teenager"
end

case "google"
when /oo/
   puts "word contains oo"
end

case 44
when -> (n) { n.even? or n < 0 }
   puts "even or less than zero"
end

case x
when Integer
   puts "It's an integer"
when String
   puts "It's a string"
end

class Empty
   def self.=== (object)
      !object or "" == object
   end
end
case ""
when Empty
   puts "name was empty"
else
   puts "name is not empty"
end

case
when ENV ['A'] == 'Y'
   puts 'A'
when ENV ['B'] == 'Y'
   puts 'B'
else
   puts 'Neither A nor B'
end

description =  case 16
               when 13..19 then "teenager"
               else ""
               end

# Truthy and Falsy values
def check_truthy(var_name, var)
   is_truthy = var ? "truthy" : "falsy"
   puts "#{var_name} is #{is_truthy}"
end
check_truthy("false", false)
check_truthy("nil", nil)
check_truthy("0", 0)
check_truthy("empty string", "")
check_truthy("\\n", "\n")
check_truthy("empty array", [])
check_truthy("empty hash", {})
# false is falsy
# nil is falsy
# 0 is truthy
# empty string is truthy
# \n is truthy
# empty array is truthy
# empty hash is truthy

# Inline if/unless
puts "x is less than 5" if x < 5
def save_to_file(data, filename)
   raise "no filename given" if filename.empty?
   return false unless data.valid?
   File.write(filename, data)
end

# while, until
i = 0
while i < 5
   puts "Iteration ##{i}"
   i += 1
end

i = 0
until i == 5
   puts "Iteration ##{i}"
   i += 1
end

# Flip-Flop operator
(1..5).select do |e|
   e if (e == 2) .. (e == 4)
end
# => [2, 3, 4]

[1, 2, 2, 3, 4, 4, 5].select do |e|
   e if (e == 2) .. (e == 4)
end
# => [2, 2, 3, 4]

(1..5).select do |e|
   (e == 2) .. (e == 4)
end
# => ArgumentError: bad value for range

((1..5).to_a * 2).select do |e|
   e if (e == 2) .. (e == 4)
end
# => [2, 3, 4, 2, 3, 4]

# unless
# Prints not inclusive
unless 'hellow'.include?('all')
   puts 'not inclusive'
end

# throw, catch
catch(:out) do
   catch(:nested) do
      puts "nested"
   end
   puts "before"
   throw :out
   puts "will not be executed"
end
puts "after"
# prints "nested", "before", "after"

# Ternary operator
# conditional ? value_if_truthy : value_if_falsy
value = true
value ? "true" : "false"
#=> "true"
value = false
value ? "true" : "false"
#=> "false"

puts (if 1 then 2 else 3 end) # => 2
puts 1 ? 2 : 3 # => 2

x = if 1 then 2 else 3 end
puts x # => 2

# Loop control with break, next, and redo
# break
actions = %w(run jump swim exit macarena)
index = 0
while index < actions.length
   action = actions[index]
   break if action == "exit"
   index += 1
   puts "Currently doing this action: #{action}"
end
# Currently doing this action: run
# Currently doing this action: jump
# Currently doing this action: swim

# next
actions = %w(run jump swim rest macarena)
index = 0
while index < actions.length
   action = actions[index]
   index += 1
   next if action == "rest"
   puts "Currently doing this action: #{action}"
end
# Currently doing this action: run
# Currently doing this action: jump
# Currently doing this action: swim
# Currently doing this action: macarena

# redo
actions = %w(run jump swim sleep macarena)
index = 0
repeat_count = 0
while index < actions.length
   action = actions[index]
   puts "Currently doing this action: #{action}"
   if action == "sleep"
      repeat_count += 1
      redo if repeat_count < 3
   end
   index += 1
end
# Currently doing this action: run
# Currently doing this action: jump
# Currently doing this action: swim
# Currently doing this action: sleep
# Currently doing this action: sleep
# Currently doing this action: sleep
# Currently doing this action: macarena

# Enumerable Iteration
[1, 2, 3].each do |item|
   next if item.even?
   puts "Item: #{item}"
end
# Item: 1
# Item: 3

# Block result values
even_value = for value in [1, 2, 3]
   break value if value.even?
end
puts "The first even value is: #{even_value}"
# The first even value is: 2

# return vs. next: non-local return in a block
def foo
   bar = [1, 2, 3, 4].map do |x|
      return 0 if x.even?
      x
   end
   puts 'baz'
   bar
end
foo # => 0

def foo
   bar = [1, 2, 3, 4].map do |x|
      next 0 if x.even?
      x
   end
   puts 'baz'
   bar
end
foo # baz
# => [1, 0, 3, 0]

# begin, end
# begin block will return the value of the last statement in the block
begin
   a = 7
   b = 6
   a * b
end # => 42

begin
   1
   2
   3
end # => 3

# Control flow with logic statements
a = 1 and b = 2
#=> a==1
#=> b==2
a = 1 && b = 2; puts a, b
#=> a==2
#=> b==2

# Lambdas
# lambda using the arrow syntax
hello_world = -> { 'Hello World!' }
hello_world[]
# 'Hello World!'

# lambda using the arrow syntax accepting 1 argument
hello_world = ->(name) { "Hello #{name}!" }
hello_world['Sven']
# "Hello Sven!"

the_thing = lambda do |magic, ohai, dere|
   puts "magic! #{magic}"
   puts "ohai #{dere}"
   puts "#{ohai} means hello"
end
the_thing.call(1, 2, 3)
# magic! 1
# ohai 3
# 2 means hello

the_thing.call(1, 2)
# ArgumentError: wrong number of arguments (2 for 3)
the_thing[1, 2, 3, 4]
# ArgumentError: wrong number of arguments (4 for 3)

the_thing = ->(magic, ohai, dere) {
   puts "magic! #{magic}"
   puts "ohai #{dere}"
   puts "#{ohai} means hello"
}
the_thing.(1, 2, 3)
# => magic! 1
# => ohai 3
# => 2 means hello
