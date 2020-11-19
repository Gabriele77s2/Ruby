# Defining a method
def hello(name)
   "Hello, #{name}"
end
hello("World")
# => "Hello, World"
hello("All")
# => "Hello, All"

# Yielding to blocks
def simple(arg1, arg2)
   puts "First we are here: #{arg1}"
   yield
   puts "Finally we are here: #{arg2}"
   yield
end
simple('start','end') { puts "Now we are inside the yield" }
#> First we are here: start
#> Now we are inside the yield
#> Finally we are here: end
#> Now we are inside the yield

def simple(arg)
   puts "Before yield"
   yield(arg)
   puts "After yield"
end
simple('Dave') { |name| puts "My name is #{name}" }
#> Before yield
#> My name is Dave
#> After yield

def countdown(num)
   num.times do |i|
      yield(num-i)
   end
end
countdown(5) { |i| puts "Call number #{i}" }
#> Call number 5
#> Call number 4
#> Call number 3
#> Call number 2
#> Call number 1

# Default parameters
def make_animal_sound(sound = 'Cuack')
   puts sound
end
make_animal_sound('Mooo') # Mooo
make_animal_sound         # Cuack

def make_animal_sound(sound = 'Cuack', volume = 11)
   play_sound(sound, volume)
end
make_animal_sound('Mooo') # Spinal Tap cow

def make_animal_sound(sound: 'Cuack', volume: 11)
   play_sound(sound, volume)
end
make_animal_sound(volume: 1) # Duck whisper

def make_animal_sound(options = {})
   options[:sound] ||= 'Cuak'
   options[:volume] ||= 11
   play_sound(sound, volume)
end
make_animal_sound(:sound => 'Mooo')

def make_animal_sound(sound = (raise 'TUU-too-TUU-too...')); p sound; end
make_animal_sound 'blaaaa' # => 'blaaaa'
make_animal_sound # => TUU-too-TUU-too... (RuntimeError)

# Optional parameter(s) (splat operator)
def welcome_guests(*guests)
   guests.each { |guest| puts "Welcome #{guest}!" }
end
welcome_guests('Tom') # Welcome Tom!
welcome_guests('Rob', 'Sally', 'Lucas') # Welcome Rob!
                                        # Welcome Sally!
                                        # Welcome Lucas!

# Required default optional parameter mix
def my_mix(name,valid=true, *opt)
   puts name
   puts valid
   puts opt
end
my_mix('me')
# 'me'
# true
# []
my_mix('me', false)
# 'me'
# false
# []
my_mix('me', true, 5, 7)
# 'me'
# true
# [5,7]

# Use a function as a block
[0, 1, 2].map {|i| i + 1} # => [1, 2, 3]

def inc(num)
   num + 1
end
[0, 1, 2].map &method(:inc) # => [1, 2, 3]

# Single required parameter
def say_hello_to(name)
   puts "Hello #{name}"
end
say_hello_to('Charles') # Hello Charles

# Tuple Arguments
def feed( amount, (animal, food) )
   p "#{amount} #{animal}s chew some #{food}"
end
feed 3, [ 'rabbit', 'grass' ] # => "3 rabbits chew some grass"

# Capturing undeclared keyword arguments (double splat)
def options(required_key:, optional_key: nil, **other_options)
   other_options
end
options(required_key: 'Done!', foo: 'Foo!', bar: 'Bar!')
#> { :foo => "Foo!", :bar => "Bar!" }

def without_double_splat(required_key:, optional_key: nil)
   # do nothing
end
without_double_splat(required_key: 'Done!', foo: 'Foo!', bar: 'Bar!')
#> ArgumentError: unknown keywords: foo, bar

def options(required_key:, optional_key: nil, **other_options)
   other_options
end
my_hash = { required_key: true, foo: 'Foo!', bar: 'Bar!' }
options(my_hash)
#> { :foo => "Foo!", :bar => "Bar!" }

my_hash = { foo: 'Foo!', bar: 'Bar!' }
options(required_key: true, **my_hash)
#> { :foo => "Foo!", :bar => "Bar!" }

# Multiple required parameters
def greet(greeting, name)
   puts "#{greeting} #{name}"
end
greet('Hi', 'Sophie') # Hi Sophie

# Method Definitions are Expressions
class Example
   puts def hello
   end
end
#=> :hello

class Class
   def logged(name)
      original_method = instance_method(name)
      define_method(name) do |*args|
         puts "Calling #{name} with #{args.inspect}."
         original_method.bind(self).call(*args)
         puts "Completed #{name}."
      end
   end
end
class Meal
   def initialize
      @food = []
   end
   logged def add(item)
   @food << item
   end
end
meal = Meal.new
meal.add "Coffee"
# Calling add with ["Coffee"].
# Completed add.
