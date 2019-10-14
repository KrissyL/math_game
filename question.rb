class Question
    
    def initialize
        @num1 = rand(1..20)
        @num2 = rand(1..20)
        @answer = @num1 + @num2
    end

    def ask_question
        puts "What is #{@num1} + #{@num2}?"
    end

    def ans(val)
        val.to_i == @answer? true : false
    end

end