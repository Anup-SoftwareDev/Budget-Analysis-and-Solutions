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
    puts "\t\tPlease Enter Y/N"
    exit
end