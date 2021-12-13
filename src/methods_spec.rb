require_relative 'methods.rb'

describe "welcome_msg" do

    it "should be defined" do
        expect(defined? welcome_msg).to eql("method")
    end

end

describe "test_integer" do

    it "should convert string numbers to integers" do
        expect(test_integer("9")).to eq(9)
    end

end

   describe "questions" do 
       it "should only accept Y" do
            expect(questions("Y")).to eq("\t\tGreat. We will first ask you a few quesitons on your income")
        end  
   end


describe "questions" do
    it "should only accept N" do
        expect(questions("N")).to eq("\t\tNo Worries. Don't hesitate to return if you feel differently")
     end
end    



