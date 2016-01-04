print "What's your first name? "
first_name = gets.chomp
first_name.capitalize!

print "Last name? "
last_name = gets.chomp
last_name.capitalize!

print "City? "
city = gets.chomp
city.capitalize!

print "State? "
state = gets.chomp
state.upcase!

puts
print "Hi #{first_name} #{last_name}!\nHow's #{city}, #{state}?"
puts
