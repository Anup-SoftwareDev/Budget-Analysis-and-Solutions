puts " "
print "\t\tWelcome to BUDGET SOLUTIONS for Professional & Affordable Solutions.\n\n"

print "\t\tTo let us help you create the very best BEST budget for you,\n\n"

print "\t\tIs it OK if we ask you a few Questions(Y/N)?\n\n"

response = (gets.chomp).capitalize

case response
when "Y" 
    puts "\t\tGreat. We will first ask you a few quesitons on your income"
when "N" 
    puts "\t\tNo Worries. Don't hesitate to return if you feel differently"
else
    while ((response != "Y")&&(response != "N")) do
        puts "\t\tPlease Enter Y/N"
        response = (gets.chomp).capitalize
        puts response
    end
        if (response == "Y") then
            puts "\t\tGreat. We will first ask you a few quesitons on your income"
        else
            puts "\t\tNo Worries. Don't hesitate to return if you feel differently"
            exit
        end    
    
end

puts "How much is your personal income?"
income = (gets.chomp).to_i
puts "How much is your personal Expense?"
expense = (gets.chomp).to_i
puts "Now your budget surplus/deficit is:"
puts "#{income-expense}"