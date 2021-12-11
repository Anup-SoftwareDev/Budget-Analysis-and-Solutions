require_relative 'methods'

welcome_msg

print "\t\tIs it OK if we ask you a few Questions(Y/N)?\n\n"

response = (gets.chomp).capitalize

questions(response)
  
budget_calculator

   