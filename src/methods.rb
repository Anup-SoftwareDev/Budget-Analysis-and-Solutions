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
        when "Y" 
            puts "\t\tGreat. We will first ask you a few quesitons on your income"
        when "N" 
            puts "\t\tNo Worries. Don't hesitate to return if you feel differently"
            exit
    end
      
end  


    def budget_calculator

        puts "How much is your personal income?"
        
        income = test_integer(gets.chomp)
       puts "How much is your personal Expense?"
       
        expense = test_integer(gets.chomp)
        puts "Now your budget surplus/deficit is:"
        puts "#{income-expense}"

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

