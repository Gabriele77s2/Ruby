# Writing a string to a file
file = File.new('tmp.txt', 'w')
file.write("NaNaNaNa\n")
file.write('Batman!\n')
file.close

File.open('tmp.txt', 'w') do |f|
   f.write("NaNaNaNa\n")
   f.write('Batman!\n')
end

File.write('tmp.txt', "NaNaNaNa\n" * 4 + 'Batman!\n')
File.write('tmp.txt', "NaNaNaNa\n" * 4 + 'Batman!\n', { mode: 'a'})

# Open and closing a file
# Using new method
f = File.new("test.txt", "r") # reading
f = File.new("test.txt", "w") # writing
f = File.new("test.txt", "a") # appending
# Using open method
f = open("test.txt", "r")
# Remember to close files
f.close
# Automatically close a file using a block.
f = File.open("test.txt", "r") do |f|
   # do something with file f
   puts f.read # for example, read it
end
