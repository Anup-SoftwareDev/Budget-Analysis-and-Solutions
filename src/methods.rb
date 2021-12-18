require('rainbow')

def welcome_msg
    puts " "
    print Rainbow("\t\tWelcome to BUDGET SOLUTIONS for Professional & Affordable Solutions").blue.bg(:yellow)
    puts "\n\n"
    print "\t\tTo let us help you create the very BEST budget for you,\n\n"
end

def questions(response)

    response = response.capitalize

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
           
    end
      
end  

def personal_Income(income_arr_categories)
    puts "We will now ask you for your Income details"
    income_file = File.open("Report.txt", "w")
income_file.puts "ENTERED INCOMES:\n"
    income_arr = []
    for index in 0..(income_arr_categories.length-1) do
        puts "How much is your #{income_arr_categories[index]}/week?"
    
        income_arr[index] = test_integer(gets.chomp)
        income_file. puts"#{income_arr_categories[index]}=#{income_arr[index]}"
    end
    income_file.close
    return income_arr
    #return (income_arr.sum).to_i
end

def personal_expense(expense_arr_categories )
    puts "We will now ask you for your Expense details"
    expense_file = File.open("Report.txt", "a")
    expense_file.puts "ENTERED EXPENSES:\n"
    expense_arr = []
    for index in 0..(expense_arr_categories.length-1) do
        puts "How much is your #{expense_arr_categories[index]}/week?"
        expense_arr[index] = test_integer(gets.chomp)
        expense_file. puts"#{expense_arr_categories[index]}=#{expense_arr[index]}"
    end
    expense_file.close
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


    if Ask_for_BudgetSolution_Option() == 1 then

        Reduce_expense_budget(income_value_arr, income_value_budgetarr, expense_value_arr, expense_value_budgetarr, income_priority, expense_priority)

        Increase_income_budget(income_value_arr, income_value_budgetarr, expense_value_arr, expense_value_budgetarr, income_priority, expense_priority)

    else  
        #User defined section
        first_option = Userdefined_Menu1()

        #Expense section for user defined menu
        if first_option == 1 then

            Userdefined_expense_reduction(expense_cat_arr, expense_value_budgetarr, expense_value_arr)
    
        else

            Userdefined_income_increase(income_cat_arr, income_value_budgetarr, income_value_arr)
               
        end
    end   

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

        puts "\nDo you need any help to improve your budget Y/N?"
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
    budgetreport_file = File.open("Report.txt", "a")
    puts "Your current expense is #{expense_value_arr.sum}"
    puts "Your expense can be budgeted to #{expense_value_budgetarr.sum} by doing the following:"

    for index_expense in 0..expense_value_arr.length-1 do
        
        if (expense_value_budgetarr[index_expense] != expense_value_arr[index_expense]) then

            puts "By reducing your #{expense_cat_arr[index_expense]} by #{(100*(1-((expense_value_budgetarr[index_expense])/expense_value_arr[index_expense]))).to_i}% or $#{(expense_value_arr[index_expense]-expense_value_budgetarr[index_expense]).to_i}"

            
            budgetreport_file.puts("By reducing your #{expense_cat_arr[index_expense]} by #{(100*(1-((expense_value_budgetarr[index_expense])/expense_value_arr[index_expense]))).to_i}% or $#{(expense_value_arr[index_expense]-expense_value_budgetarr[index_expense]).to_i}")
            

        end
    end
    budgetreport_file.close
end

def Print_income_budget_Report(income_cat_arr, income_value_arr, income_value_budgetarr)

    budgetreport_file = File.open("Report.txt", "a")

    puts "Your current income is #{income_value_arr.sum}"
    puts "Your income would have to be increased to #{income_value_budgetarr.sum} by doing the following:"

    for index_income in 0..income_value_arr.length-1 do
        
        if (income_value_budgetarr[index_income] != income_value_arr[index_income]) then

            puts "By increasing your #{income_cat_arr[index_income]} by #{(100*(((income_value_budgetarr[index_income])/income_value_arr[index_income])-1)).to_i}% or $#{(income_value_budgetarr[index_income]-income_value_arr[index_income]).to_i}"

            budgetreport_file.puts("By increasing your #{income_cat_arr[index_income]} by #{(100*(((income_value_budgetarr[index_income])/income_value_arr[index_income])-1)).to_i}% or $#{(income_value_budgetarr[index_income]-income_value_arr[index_income]).to_i}")

        end
    end
    budgetreport_file.close
end

def Ask_for_BudgetSolution_Option()

    puts "Pick one of the following Options: \n1)Provide you with Our recomended Budget Solution \n 2)Create your own Budget Solution"
    option = (gets.chomp).to_i

    while ((option != 1)&&(option != 2)) do
        puts "\t\tPlease Enter 1/2"
        option = (gets.chomp).to_i
    end

    return option

end

def Userdefined_Menu1()

    puts "Great! We will help you test out different ways to improve the budget"
        puts "Which of the following Options do you want to try out first. Pick 1 or 2: \n1)Reduce Expenses \n 2)Increase Income"
        first_option = (gets.chomp).to_i

       while ((first_option != 1)&&(first_option != 2)) do
           puts "\t\tPlease Enter 1/2"
           first_option = (gets.chomp).to_i
        end
        return first_option
end

def Userdefined_Menu2a(expense_cat_arr)

    puts "Great! Reducing Expenses is a great start"
            puts "Which of the following Expenses do you want to try reduce first. Pick One:" 


            for exp_index in 0..(expense_cat_arr.length-1) do
                    puts "\n #{exp_index+1}) #{expense_cat_arr[exp_index]}"
            end
        
            expense_option = (gets.chomp).to_i
            while ((expense_option < 1)||(expense_option > 6)) do
        
                puts "\t\tPlease Enter numbers between 1 to 6"
                expense_option = (gets.chomp).to_i
            end
            return expense_option

end

def Userdefined_Menu2b(income_cat_arr)

    puts "Great! Good to get more money"
    puts "Which of the following Income Categories do you want to try increase first. Pick One:" 

    for inc_index in 0..(income_cat_arr.length-1) do
            puts "\n #{inc_index+1}) #{income_cat_arr[inc_index]}"
    end
    

    income_option = (gets.chomp).to_i
    while ((income_option < 1)||(income_option > 4)) do

        puts "\t\tPlease Enter numbers between 1 to 4"
        income_option = (gets.chomp).to_i
    end
    return income_option

end


def Userdefined_expense_reduction (expense_cat_arr, expense_value_budgetarr, expense_value_arr)

        need_to_reduce_more = true

        while need_to_reduce_more == true do
    
            expense_option = Userdefined_Menu2a(expense_cat_arr)

            puts "How much do you want to reduce #{expense_cat_arr[expense_option-1]} by"
            puts "1)5% 2)10% 3)20% Pick One"

            expense_reduction_option = (gets.chomp).to_i
            while ((expense_reduction_option < 1)||(expense_reduction_option > 3)) do
        
                puts "\t\tPlease Enter numbers between 1 to 3"
                expense_reduction_option = (gets.chomp).to_i
            end 

            case expense_reduction_option
                when 1
                    expense_value_budgetarr[expense_option-1] = expense_value_budgetarr[expense_option-1]- 0.05*(expense_value_arr[expense_option-1])

                when 2
                    expense_value_budgetarr[expense_option-1] = expense_value_budgetarr[expense_option-1]- 0.1*(expense_value_arr[expense_option-1])

                when 3
                    expense_value_budgetarr[expense_option-1] = expense_value_budgetarr[expense_option-1]- 0.2*(expense_value_arr[expense_option-1])

            end
            puts "Do you need to reduce more expenses Y/N"
            reduce_more_choice = (gets.chomp).capitalize
            while ((reduce_more_choice != "Y")&&(reduce_more_choice != "N")) do
                puts "\t\tPlease Enter Y/N"
                reduce_more_choice = (gets.chomp).capitalize
            end
            case reduce_more_choice
                
                when "N" 
                    
                    need_to_reduce_more = false
                
                when "Y" 
                    
                    need_to_reduce_more = true
            end
            puts need_to_reduce_more
        end
end


def Userdefined_income_increase (income_cat_arr, income_value_budgetarr, income_value_arr)

    need_to_increase_more = true

    while need_to_increase_more == true do

        income_option = Userdefined_Menu2b(income_cat_arr)

        puts "How much do you want to increase #{income_cat_arr[income_option-1]} by"
        puts "1)5% 2)10% 3)20% Pick One"

        income_reduction_option = (gets.chomp).to_i
        while ((income_reduction_option < 1)||(income_reduction_option > 3)) do
    
            puts "\t\tPlease Enter numbers between 1 to 3"
            income_reduction_option = (gets.chomp).to_i
        end 

        case income_reduction_option
            when 1
                income_value_budgetarr[income_option-1] = income_value_budgetarr[income_option-1]+ 0.05*(income_value_arr[income_option-1])

            when 2
                income_value_budgetarr[income_option-1] = income_value_budgetarr[income_option-1]+ 0.10*(income_value_arr[income_option-1])

            when 3
                income_value_budgetarr[income_option-1] = income_value_budgetarr[income_option-1]+ 0.20*(income_value_arr[income_option-1])

        end
        puts "Do you need to increase more expenses Y/N"
        increase_more_choice = (gets.chomp).capitalize
        while ((increase_more_choice != "Y")&&(increase_more_choice != "N")) do
            puts "\t\tPlease Enter Y/N"
            increase_more_choice = (gets.chomp).capitalize
        end
        case increase_more_choice
            
            when "N" 
                
                need_to_increase_more = false
            
            when "Y" 
                
                need_to_increase_more = true
        end
        puts need_to_increase_more
    end
end