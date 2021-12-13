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
            return "\t\tGreat. We will ask you a few quesitons and try help you."
            #exit
    end
      
end  

def personal_Income(income_arr_categories)
    puts "We will now ask you for your Income details"
    
    income_arr = []
    for index in 0..(income_arr_categories.length-1) do
        puts "How much is your #{income_arr_categories[index]}/week?"
        income_arr[index] = test_integer(gets.chomp)
    end
    return income_arr
    #return (income_arr.sum).to_i
end

def personal_expense(expense_arr_categories )
    puts "We will now ask you for your Expense details"
   
    expense_arr = []
    for index in 0..(expense_arr_categories.length-1) do
        puts "How much is your #{expense_arr_categories[index]}/week?"
        expense_arr[index] = test_integer(gets.chomp)
    end
    #return (expense_arr.sum).to_i 
    return expense_arr
end



    def budget_calculator(income,expense)
     
        #puts "Now your budget surplus/deficit is:"
    
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

def budget_advice(budget_result, income_cat_arr, expense_cat_arr, income_value_arr, expense_value_arr)

    if  budget_result > 0 then

        puts "Your budget is looking under control, you have a budget surplus of:"
        print "$#{budget_result}"
        
    else
        puts "Your budget needs improvement, you have a budget shortage of:"
        print "$#{budget_result}"
    end

    puts "\nDo you need any advice to improve your budget Y/N?"
    puts questions((gets.chomp).capitalize)

    #if  questions((gets.chomp).capitalize) == "Y" then

        expense_value_arr[2]= expense_value_arr[2]- 0.1*expense_value_arr[2]

        puts "You can improve your budget by reducing #{expense_cat_arr[2]} by 10%"
        puts "This will result in budget surplus of #{budget_calculator(income_value_arr.sum, expense_value_arr.sum )}"
        
    #else
        
    #end

end    