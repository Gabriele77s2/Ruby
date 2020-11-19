# Constructor
class Customer
   def initialize(name)
      @name = name.capitalize
   end
end
sarah = Customer.new('sarah')
sarah.name #=> 'Sarah'

# Access Levels
# public
class Cat
   def initialize(name)
      @name = name
   end
   def speak
      puts "I'm #{@name} and I'm 2 years old"
   end
   ...
end
new_cat = Cat.new("garfield")
#=> <Cat:0x2321868 @name="garfield">
new_cat.speak
#=> I'm garfield and I'm 2 years old

# private
class Cat
   def initialize(name)
      @name = name
   end
   def speak
      age = calculate_cat_age # here we call the private method
      puts "I'm #{@name} and I'm #{age} years old"
   end
   private
   def calculate_cat_age
      2 * 3 - 4
   end
end
my_cat = Cat.new("Bilbo")
my_cat.speak #=> I'm Bilbo and I'm 2 years old
my_cat.calculate_cat_age #=> NoMethodError: private method `calculate_cat_age' called for <Cat:0x2321868 @name="Bilbo">

# protected
class Cat
   def initialize(name, age)
      @name = name
      @age = age
   end
   def speak
      puts "I'm #{@name} and I'm #{@age} years old"
   end
   # this == method allows us to compare two objects own ages.
   # if both Cat's have the same age they will be considered equal.
   def ==(other)
      self.own_age == other.own_age
   end
   protected
   def own_age
      self.age
   end
end
cat1 = Cat.new("ricky", 2)
# <Cat:0x007fe2b8aa4a18 @name="ricky", @age=2>
cat2 = Cat.new("lucy", 4)
# <Cat:0x008gfb7aa6v67 @name="lucy", @age=4>
cat3 = Cat.new("felix", 2)
# <Cat:0x009frbaa8V76 @name="felix", @age=2>

# Class Methods types
# instance
class Thing
   def somemethod
      puts "something"
   end
end
foo = Thing.new # create an instance of the class
foo.somemethod # => something

# class
class Thing
   def Thing.hello(name)
      puts "Hello, #{name}!"
   end
end

class Thing
   def self.hello(name)
      puts "Hello, #{name}!"
   end
end
Thing.hello("John Doe") # prints: "Hello, John Doe!"

# singleton
# create an empty class
class Thing
end
# two instances of the class
thing1 = Thing.new
thing2 = Thing.new
# create a singleton method
def thing1.makestuff
   puts "I belong to thing one"
end
thing1.makestuff # => prints: I belong to thing one
thing2.makestuff # NoMethodError: undefined method `makestuff' for #<Thing>

# a class method (same as the above example)
class Thing
   class << self # the anonymous class
      def hello(name)
         puts "Hello, #{name}!"
      end
   end
end
Thing.hello("sarah") # => Hello, sarah!

# singleton method
class Thing
end
thing1 = Thing.new

class << thing1
   def makestuff
      puts "I belong to thing one"
   end
end
thing1.makestuff # => prints: "I belong to thing one"

# Accessing instance variables with getters and setters
# 1. attr_reader : used to allow read ing the variable outside the class.
# 2. attr_writer : used to allow modifying the variable outside the class.
# 3. attr_accessor : combines both methods.
class Cat
   attr_reader :age # you can read the age but you can never change it
   attr_writer :name # you can change name but you are not allowed to read
   attr_accessor :breed # you can both change the breed and read it
   def initialize(name, breed)
      @name = name
      @breed = breed
      @age = 2
   end
   def speak
      puts "I'm #{@name} and I am a #{@breed} cat"
   end
end
my_cat = Cat.new("Banjo", "birman")
# reading values:
my_cat.age #=> 2
my_cat.breed #=> "birman"
my_cat.name #=> Error
# changing values
my_cat.age = 3 #=> Error
my_cat.breed = "sphynx"
my_cat.name = "Bilbo"
my_cat.speak #=> I'm Bilbo and I am a sphynx cat

# Dynamic class creation
# create a new class dynamically
MyClass = Class.new
# instantiate an object of type MyClass
my_class = MyClass.new
# dynamically create a class that subclasses another
Staffy = Class.new(Dog)
# instantiate an object of type Staffy
lucky = Staffy.new
lucky.is_a?(Staffy) # true
lucky.is_a?(Dog) # true

Duck =
   Class.new do
      def quack
         'Quack!!'
      end
   end
# instantiate an object of type Duck
duck = Duck.new
duck.quack # 'Quack!!'

# Class and instance variables
class Person
   def initialize(name, age)
      my_age = age # local variable, will be destroyed at end of constructor
      @name = name # instance variable, is only destroyed when the object is
   end
   def some_method
      puts "My name is #{@name}." # we can use @name with no problem
   end
   def another_method
      puts "My age is #{my_age}." # this will not work!
   end
end
mhmd = Person.new("Mark", 23)
mhmd.some_method #=> My name is Mark.
mhmd.another_method #=> throws an error

class Person
   @@persons_created = 0 # class variable, available to all objects of this class
   def initialize(name)
      @name = name
      # modification of class variable persists across all objects of this class
      @@persons_created += 1
   end
   def how_many_persons
      puts "persons created so far: #{@@persons_created}"
   end
end
mark = Person.new("Mark")
mark.how_many_persons #=> persons created so far: 1
helen = Person.new("Helen")
mark.how_many_persons #=> persons created so far: 2
helen.how_many_persons #=> persons created so far: 2
# you could either ask mark or helen

# Global Variables, preceded by $ . These are available anywhere to the program, so make sure to use them wisely.
$total_animals = 0
class Cat
   def initialize
      $total_animals += 1
   end
end
class Dog
   def initialize
      $total_animals += 1
   end
end
bob = Cat.new()
puts $total_animals #=> 1
fred = Dog.new()
puts $total_animals #=> 2
