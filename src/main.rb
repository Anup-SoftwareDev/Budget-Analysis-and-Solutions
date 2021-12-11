require_relative 'methods'
require('colorize')

welcome_msg

print "\t\tIs it OK if we ask you a few Questions(Y/N)?\n\n".blue

response = (gets.chomp).capitalize

questions(response)
  
budget_calculator

   