require_relative 'methods'
require('colorize')
require('rspec')

personal_income_categories = ["Wages/Salary","Rental Income","Investment Income","Other Income"]
personal_expense_categories = ["Groceries","School Fees", "Shopping", "Entertainment", "Rent/Mortgage","Other Expenses"]
personal_income_arr = [100,100,100,100]
personal_expense_arr = [100,100,100,100,100,50]
personal_income_budgetarr = []
personal_expense_budgetarr = []


welcome_msg

print "\t\tIs it OK if we ask you a few Questions(Y/N)?\n\n".blue

response = (gets.chomp).capitalize

puts questions(response)

#personal_income_arr = personal_Income(personal_income_categories)
#personal_expense_arr = personal_expense(personal_expense_categories)
  
budget_advice(budget_calculator(personal_income_arr.sum , personal_expense_arr.sum), personal_income_categories, personal_expense_categories, personal_income_arr, personal_expense_arr, personal_income_budgetarr,  personal_expense_budgetarr)
