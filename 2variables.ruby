# Class Variables
class Dinosaur
   @@classification = "Like a Reptile, but like a bird"
   def self.classification
      @@classification
   end
   def classification
      @@classification
   end
end
dino = Dinosaur.new
dino.classification
# => "Like a Reptile, but like a bird"
Dinosaur.classification
# => "Like a Reptile, but like a bird"

class TRex < Dinosaur
   @@classification = "Big teeth bird!"
end
TRex.classification
# => "Big teeth bird!"
Dinosaur.classification
# => "Big teeth bird!"

module SomethingStrange
   @@classification = "Something Strange"
end
class DuckDinosaur < Dinosaur
   include SomethingStrange
end
DuckDinosaur.class_variables
# => [:@@classification]
SomethingStrange.class_variables
# => [:@@classification]
DuckDinosaur.classification
# => "Big teeth bird!"

# Local Variables
local_variable = "local"
p local_variable
# => local

def some_method
   method_scope_var = "hi there"
   p method_scope_var
end
some_method
# => hi there
method_scope_var
# NameError: undefined local variable or method `method_scope_var'

2.times do |n|
   local_var = n + 1
   p local_var
end
# 1
# 2
# => 2
local_var
# NameError: undefined local variable or method `local_var'

my_variable = "foo"
my_variable.split("").each_with_index do |char, i|
   puts "The character in string '#{my_variable}' at index #{i} is #{char}"
end
# The character in string 'foo' at index 0 is f
# The character in string 'foo' at index 1 is o
# The character in string 'foo' at index 2 is o
# => ["f", "o", "o"]

my_variable = "foo"
def some_method
   puts "you can't use the local variable in here, see? #{my_variable}"
end
some_method
# NameError: undefined local variable or method `my_variable'

overshadowed = "sunlight"
["darkness"].each do |overshadowed|
   p overshadowed
end
# => ["darkness"]
p overshadowed
# => "sunlight"

# Global Variables
$i_am_global = "omg"
class Dinosaur
   def instance_method
      p "global vars can be used everywhere. See? #{$i_am_global}, #{$another_global_var}"
   end
   def self.class_method
      $another_global_var = "srsly?"
      p "global vars can be used everywhere. See? #{$i_am_global}"
   end
end
Dinosaur.class_method
# => "global vars can be used everywhere. See? omg"
dinosaur = Dinosaur.new
dinosaur.instance_method
# => "global vars can be used everywhere. See? omg, srsly?"

# Instance Variables
class Dinosaur
   @base_sound = "rawrr"
   def initialize(sound = nil)
      @sound = sound || self.class.base_sound
   end
   def speak
      @sound
   end
   def try_to_speak
      @base_sound
   end
   def count_and_store_sound_length
      @sound.chars.each_with_index do |char, i|
         @sound_length = i + 1
         p "#{char}: #{sound_length}"
      end
   end
   def sound_length
      @sound_length
   end
   def self.base_sound
      @base_sound
   end
end
dino_1 = Dinosaur.new
dino_2 = Dinosaur.new "grrr"
Dinosaur.base_sound
# => "rawrr"
dino_2.speak
# => "grrr"
dino_1.speak
# => "rawwr"
dino_1.count_and_store_sound_length
# "r: 1"
# "a: 2"
# "w: 3"
# "r: 4"
# "r: 5"
# => ["r", "a", "w", "r", "r"]
dino_1.sound_length
# => 5

class DuckDuckDinosaur < Dinosaur
   @base_sound = "quack quack"
end
duck_dino = DuckDuckDinosaur.new
duck_dino.speak
# => "quack quack"
DuckDuckDinosaur.base_sound
# => "quack quack"
Dinosaur.base_sound
# => "rawrr"

# Constants
MY_CONSTANT = "Hello, world" # constant
Constant = 'This is also constant' # constant
my_variable = "Hello, venus" # not constant

# Modify a Constant
MY_CONSTANT = "Hello, world"
MY_CONSTANT = "Hullo, world"

MY_CONSTANT = "Hello, world"
MY_CONSTANT[1] = "u"

# Constants cannot be defined in methods
# Define and change constants in a class
class Message
   DEFAULT_MESSAGE = "Hello, world"
   def speak(message = nil)
      if message
         puts message
      else
         puts DEFAULT_MESSAGE
      end
   end
end
Message::DEFAULT_MESSAGE = "Hullo, world"
