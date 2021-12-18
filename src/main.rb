require_relative 'methods'
require('colorize')
require('rspec')

begin
    personal_income_categories = ["Wages/Salary","Rental Income","Investment Income","Other Income"]
    personal_expense_categories = ["Groceries","School Fees", "Shopping", "Entertainment", "Rent/Mortgage","Other Expenses"]
    personal_income_priority = [0,2,1,3]
    personal_expense_priority = [3,2,0,5,4,1]
    personal_income_budgetarr = []
    personal_expense_budgetarr = []
    savings_rates = [1, 2, 3, 2, 4, 6, -1, 5, 10]
    savings_rates_cat = ["Conservative Minimum", "Conservative Medium", "Coservative Max", "Balanced Minimum", "Balanced Medium", "Balance Max", "High Risk Minimum", "High Risk Medium", "High risk Max" ]
    

    welcome_msg


    print "\t\tIs it OK if we ask you a few Questions(Y/N)?\n\n".blue

    response = (gets.chomp).capitalize

    puts questions(response)


    personal_income_arr = personal_Income(personal_income_categories)
    personal_expense_arr = personal_expense(personal_expense_categories)
    
    budget_advice(budget_calculator(personal_income_arr.sum , personal_expense_arr.sum), personal_income_categories, personal_expense_categories, personal_income_arr, personal_expense_arr, personal_income_budgetarr,  personal_expense_budgetarr,personal_income_priority,personal_expense_priority)

    puts "Do you want us to help you with any investment advice for the Future"
    puts "Please Enter Y/N"
    questions(gets.chomp)

    puts"How much Savings do you have all together"
    savings = test_integer(gets.chomp)
    puts "How many years do you want to see the savings grow"
    years = test_integer(gets.chomp)
    investment_file = File.open("Report.txt", "a")
    investment_file.puts"\nINVESTMENT SOLUTIONS"
    investment_file.puts" Investmetn Income = #{savings}\n"
    investment_file.puts"\nYears to Invest = #{years}"
    for index in 0..8 do

        calc = ((savings_rates[index])/100.0)
        #puts calc
        result = savings * (1 + calc/12) ** (12*years)

        puts "Your savings for #{savings_rates_cat[index]} after #{years}years is $#{result.to_i}"
        investment_file.puts "Your savings for #{savings_rates_cat[index]} after #{years}years is $#{result.to_i}"
    end
investment_file.close

# Error Handling

    rescue ZeroDivisionError
        puts "You can not divide by Zero"
    rescue 
        puts "Something unexpected has happened"
    ensure
       puts "Wish you the best with your budget for the future!"

end
