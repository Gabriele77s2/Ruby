# Subclasses
class Animal
   def say_hello
      'Meep!'
   end
   def eat
      'Yumm!'
   end
end

class Dog < Animal
   def say_hello
      'Woof!'
   end
end
spot = Dog.new
spot.say_hello # 'Woof!'
spot.eat # 'Yumm!'

# What is inherited?
# Methods are inherited
class A
   def boo; p 'boo' end
end

class B < A; end
b = B.new
b.boo # => 'boo'

# Class methods are inherited
class A
   def self.boo; p 'boo' end
end

class B < A; end
p B.boo # => 'boo'

# Constants are inherited
class A
   WOO = 1
end

class B < A; end
p B::WOO # => 1

class B
   WOO = WOO + 1
end
p B::WOO # => 2

# Instance variables are inherited:
class A
   attr_accessor :ho
   def initialize
      @ho = 'haha'
   end
end

class B < A; end
b = B.new
p b.ho # => 'haha'

class C < A
   def initialize; end
end
c = C.new
p c.ho # => nil

# Class instance variables are not inherited:
class A
   @foo = 'foo'
   class << self
      attr_accessor :foo
   end
end

class B < A; end
p B.foo # => nil
# The accessor is inherited, since it is a class method
B.foo = 'fob' # possible

# Class variables aren't really inherited
class A
   @@foo = 0
   def initialize
      @@foo += 1
      p @@foo
   end
end

class B < A;end
a = A.new # => 1
b = B.new # => 2

class C < A
   def initialize
      @@foo = -10
      p @@foo
   end
end
a = C.new # => -10
b = B.new # => -9

# Decorator Pattern
class Pizza
   def cost
      300
   end
end
module CheesePizza
   def cost
      super + 50
   end
end
module LargePizza
   def cost
      super + 100
   end
end
pizza = Pizza.new #=> cost = 300
pizza.extend(CheesePizza) #=> cost = 350
pizza.extend(LargePizza) #=> cost = 450
pizza.cost #=> cost = 450
