require('rainbow')

def welcome_msg
    puts " "
    print Rainbow("\t\tWelcome to BUDGET SOLUTIONS for Professional & Affordable Solutions").blue.bg(:yellow)
    puts "\n\n"
    print "\t\tTo let us help you create the very BEST budget for you,\n\n"
end

def questions(response)
    while ((response != "Y")&&(response != "N")) do
        puts "\t\tPlease Enter Y/N"
        response = (gets.chomp).capitalize
    end
    case response
        
        when "N" 
            puts "\t\tNo Worries. Don't hesitate to return if you feel differently"
            exit
        when "Y" 
            return "\t\tGreat. We will first ask you a few quesitons on your income"
            #exit
    end
      
end  

def personal_Income
    puts "We will now ask you for your Income details"
    income_arr = []
    puts "How much is your wages/week"
    income_arr[0] = test_integer(gets.chomp)
    puts "How much is your investments interest/week"
    income_arr[1] = test_integer(gets.chomp)
    puts "How much is your rental Income/week"
    income_arr[2] = test_integer(gets.chomp)
    puts "How much is your Other Income/week"
    income_arr[3] = test_integer(gets.chomp)
    return (income_arr.sum).to_i
end

def personal_expense
    expense_arr = []
    puts "We will now ask you for your Expense details"
    puts "How much is your Groceries/week"
    expense_arr[0] = test_integer(gets.chomp)
    puts "How much is your school fees/week"
    expense_arr[1] = test_integer(gets.chomp)
    puts "How much is your Rent/week"
    expense_arr[2] = test_integer(gets.chomp)
    puts "How much is your Mortgage/week"
    expense_arr[3] = test_integer(gets.chomp)
    puts "How much is your Other expense/week"
    expense_arr[4] = test_integer(gets.chomp)
    return (expense_arr.sum).to_i 
end



    def budget_calculator(income,expense)

        #puts "How much is your personal income?"
        
        #income = test_integer(gets.chomp)
       #puts "How much is your personal Expense?"
       
        #expense = test_integer(gets.chomp)
     puts "Now your budget surplus/deficit is:"
        #puts "#{income-expense}"
    
   return (income-expense)
    end


def test_integer(test_num)

    num_cond = Integer(test_num) rescue false
    if num_cond
        return test_num.to_i
    else
        while num_cond == false do
            puts "Please enter a value closest to an integer"
            num_cond = Integer(gets.chomp) rescue false
        end
        return num_cond.to_i
    end

end    

