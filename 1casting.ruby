# Casting to a Float
"123.50".to_f #=> 123.5
Float("123.50") #=> 123.5

# Casting to a String
123.5.to_s #=> "123.5"
String(123.5) #=> "123.5"
sprintf("%s", 123.5) #=> "123.5"
"%s" % 123.5 #=> "123.5"
"%d" % 123.5 #=> "123"
"%.2f" % 123.5 #=> "123.50"

# Casting to an Integer
"123.50".to_i #=> 123
Integer("123.50") #=> 123
"123-foo".to_i # => 123
"foo-123".to_i # => 0

# Floats and Integers
1 / 2 #=> 0
1.0 / 2 #=> 0.5
1.to_f / 2 #=> 0.5
1 / Float(2) #=> 0.5
1.fdiv 2 # => 0.5
