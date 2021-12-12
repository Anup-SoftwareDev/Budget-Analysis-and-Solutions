require_relative 'methods'
require('colorize')
require('rspec')

welcome_msg

print "\t\tIs it OK if we ask you a few Questions(Y/N)?\n\n".blue

response = (gets.chomp).capitalize

puts questions(response)

  
puts budget_calculator(personal_Income, personal_expense)
