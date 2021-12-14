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

def budget_advice(budget_result, income_cat_arr, expense_cat_arr, income_value_arr, expense_value_arr, income_value_budgetarr, expense_value_budgetarr)

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

       # expense_value_arr[2]= expense_value_arr[2]- 0.1*expense_value_arr[2]

       # puts "You can improve your budget by reducing #{expense_cat_arr[2]} by 10%"
       # puts "This will result in budget surplus of #{budget_calculator(income_value_arr.sum, expense_value_arr.sum )}"
        
    #else
        
    #end
        for index in 0..income_value_arr.length-1 do
            income_value_budgetarr[index] = income_value_arr[index]
            
        end

        for index in 0..expense_value_arr.length-1 do
            
            expense_value_budgetarr[index] = expense_value_arr[index]
        end
       

        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(expense_value_budgetarr[3] > (0.7)*expense_value_arr[3]) do
            expense_value_budgetarr[3] = expense_value_budgetarr[3] - 0.1*expense_value_arr[3]
            
        end
        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(expense_value_budgetarr[2] > (0.7)*expense_value_arr[2]) do
            expense_value_budgetarr[2] = expense_value_budgetarr[2] - 0.1*expense_value_arr[2]
            
        end
        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(expense_value_budgetarr[0] > (0.7)*expense_value_arr[0]) do
            expense_value_budgetarr[0] = expense_value_budgetarr[0] - 0.1*expense_value_arr[0]
            
        end
        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(expense_value_budgetarr[5] > (0.7)*expense_value_arr[5]) do
            expense_value_budgetarr[5] = expense_value_budgetarr[5] - 0.1*expense_value_arr[5]   
        end
        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(expense_value_budgetarr[4] > (0.7)*expense_value_arr[4]) do
            expense_value_budgetarr[4] = expense_value_budgetarr[4] - 0.1*expense_value_arr[4]   
        end
        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(expense_value_budgetarr[1] > (0.7)*expense_value_arr[1]) do
            expense_value_budgetarr[1] = expense_value_budgetarr[1] - 0.1*expense_value_arr[1]   
        end

        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(income_value_budgetarr[0] < (1.3)*income_value_arr[0]) do
            income_value_budgetarr[0] = income_value_budgetarr[0] + 0.1*income_value_arr[0]   
        end
        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(income_value_budgetarr[1] < (1.3)*income_value_arr[1]) do
            income_value_budgetarr[1] = income_value_budgetarr[1] + 0.1*income_value_arr[1]   
        end
        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(income_value_budgetarr[2] < (1.3)*income_value_arr[2]) do
            income_value_budgetarr[2] = income_value_budgetarr[2] + 0.1*income_value_arr[2]   
        end

        while (income_value_budgetarr.sum < (1.2)*(expense_value_budgetarr.sum))&&(income_value_budgetarr[3] < (1.3)*income_value_arr[3]) do
            income_value_budgetarr[3] = income_value_budgetarr[3] + 0.1*income_value_arr[3]   
        end

    

        #puts expense_value_budgetarr[3]

     #   while (income_value_budgetarr.sum < ((1.2)*(expense_value_budgetarr.sum)))||(expense_value_budgetarr[3]<(0.7)*expense_value_arr[3]) do
      #      expense_value_budgetarr[3] = expense_value_budgetarr[3] - 0.1*expense_value_arr[3]
       # end

    #while (((expense_value_budgetarr[3])>((0.7)*expense_value_arr[3]))) do
     #     if !((expense_value_budgetarr[3]<(0.7)*expense_value_arr[3])) then
      #      expense_value_budgetarr[3] = expense_value_budgetarr[3] - 0.1*expense_value_arr[3]
    #    end
    
    #end

    #    pp income_value_arr
    #    pp income_value_budgetarr
    #    pp expense_value_arr
    #    pp expense_value_budgetarr
    puts "Your budget income is #{income_value_budgetarr.sum}"
    puts "Your budget expense is #{expense_value_budgetarr.sum}"


    for index_expense in 0..expense_value_arr.length-1 do
        
        if (expense_value_budgetarr[index_expense] != expense_value_arr[index_expense]) then

            puts "By reducing your #{expense_cat_arr[index_expense]} by #{(100*(1-((expense_value_budgetarr[index_expense])/expense_value_arr[index_expense]))).to_i}% or $#{(expense_value_arr[index_expense]-expense_value_budgetarr[index_expense]).to_i}"

        end
    end

    for index_income in 0..income_value_arr.length-1 do
        
        if (income_value_budgetarr[index_income] != income_value_arr[index_income]) then

            puts "By increasing your #{income_cat_arr[index_income]} by #{(100*(((income_value_budgetarr[index_income])/income_value_arr[index_income])-1)).to_i}% or $#{(income_value_budgetarr[index_income]-income_value_arr[index_income]).to_i}"

        end
    end


end    