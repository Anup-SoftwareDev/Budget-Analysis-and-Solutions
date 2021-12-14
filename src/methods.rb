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

def budget_advice(budget_result, income_cat_arr, expense_cat_arr, income_value_arr, expense_value_arr, income_value_budgetarr, expense_value_budgetarr, income_priority, expense_priority)
    

    Anounce_budget_Result(budget_result)

    Initialize_budgetarr_to_currentarr(income_value_arr,income_value_budgetarr, expense_value_arr,expense_value_budgetarr)

    Reduce_expense_budget(income_value_arr, income_value_budgetarr, expense_value_arr, expense_value_budgetarr, income_priority, expense_priority)

    Increase_income_budget(income_value_arr, income_value_budgetarr, expense_value_arr, expense_value_budgetarr, income_priority, expense_priority)

    Print_expense_budget_Report(expense_cat_arr, expense_value_arr, expense_value_budgetarr) 

    Print_income_budget_Report(income_cat_arr, income_value_arr, income_value_budgetarr)

end    

def Anounce_budget_Result(budg_result)

    if  budg_result > 0 then

           puts "Your budget is looking under control, you have a budget surplus of:"
           print "$#{budg_result}"
            
        else
            puts "Your budget needs improvement, you have a budget defecit of:"
            print "$#{budg_result}"
        end

        puts "\nDo you need any advice to improve your budget Y/N?"
        puts questions((gets.chomp).capitalize)

end

def Initialize_budgetarr_to_currentarr(income_value_arr,income_value_budgetarr, expense_value_arr,expense_value_budgetarr)

    for index in 0..income_value_arr.length-1 do
        income_value_budgetarr[index] = income_value_arr[index]
        
    end

    for index in 0..expense_value_arr.length-1 do
        
        expense_value_budgetarr[index] = expense_value_arr[index]
    end

end

def Reduce_expense_budget(income_value_arr, income_value_budgetarr, expense_value_arr, expense_value_budgetarr, income_priority, expense_priority)

    if (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum)) then
        for x in 0..expense_priority.length-1 do
            while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(expense_value_budgetarr[expense_priority[x]] > (0.6)*expense_value_arr[expense_priority[x]]) do
                expense_value_budgetarr[expense_priority[x]] = expense_value_budgetarr[expense_priority[x]] - 0.1*expense_value_arr[expense_priority[x]]
                
            end
        end
    end

end

def Increase_income_budget(income_value_arr, income_value_budgetarr, expense_value_arr, expense_value_budgetarr, income_priority, expense_priority)
    loop_times = 0
    while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum)) do
        for y in 0..income_priority.length-1 do
            while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(income_value_budgetarr[income_priority[y]] < (1.3+loop_times)*income_value_arr[income_priority[y]]) do
                income_value_budgetarr[income_priority[y]] = income_value_budgetarr[income_priority[y]] + 0.1*income_value_arr[income_priority[y]]   
            end
        end
        loop_times = loop_times+0.35

    end

end

def Print_expense_budget_Report(expense_cat_arr, expense_value_arr, expense_value_budgetarr) 

    puts "Your current expense is #{expense_value_arr.sum}"
    puts "Your expense can be budgeted to #{expense_value_budgetarr.sum} by doing the following:"

    for index_expense in 0..expense_value_arr.length-1 do
        
        if (expense_value_budgetarr[index_expense] != expense_value_arr[index_expense]) then

            puts "By reducing your #{expense_cat_arr[index_expense]} by #{(100*(1-((expense_value_budgetarr[index_expense])/expense_value_arr[index_expense]))).to_i}% or $#{(expense_value_arr[index_expense]-expense_value_budgetarr[index_expense]).to_i}"

        end
    end

end

def Print_income_budget_Report(income_cat_arr, income_value_arr, income_value_budgetarr)
    puts "Your current income is #{income_value_arr.sum}"
    puts "Your income would have to be increased to #{income_value_budgetarr.sum} by doing the following:"

    for index_income in 0..income_value_arr.length-1 do
        
        if (income_value_budgetarr[index_income] != income_value_arr[index_income]) then

            puts "By increasing your #{income_cat_arr[index_income]} by #{(100*(((income_value_budgetarr[index_income])/income_value_arr[index_income])-1)).to_i}% or $#{(income_value_budgetarr[index_income]-income_value_arr[index_income]).to_i}"

        end
    end
end