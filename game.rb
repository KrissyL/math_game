class Game
    
    def turn (current_player, player1, player2)
        current_player == player1 ? current_player = player2 : current_player = player1
    end

    def start
        puts "Hello Player One, what is your name?"

        name1 = gets.chomp
        player1 = Player.new(name1)

        puts "Nice to meet you #{player1.name}"

        puts "Player Two, what is your name?"

        name2 = gets.chomp
        player2 = Player.new(name2)

        puts "Nice to meet you too, #{player2.name}"

        current_player = player1

        while player1.life > 0 && player2.life > 0 do
            
        question = Question.new
        puts "#{current_player.name} You're up! \n\n"
        question.ask_question
        
            begin
                Timeout::timeout 5 do
                ans = gets.chomp
                if question.ans(ans) == true
                    puts "That's correct!\n\n"
                else 
                    puts "Sorry, that's wrong!\n\n"
                    current_player.lose_life
                end
            end
            rescue Timeout::Error
                answer = nil
                current_player.lose_life
                puts "You ran out of time!\n\n"
            end
            puts "Standings: #{player1.name} #{player1.life}/3, #{player2.name} #{player2.life}/3\n\n"
            current_player = turn(current_player, player1, player2)
        
        end
        puts "#{current_player.name} is the Winner! New Game(Y/N)?"
        restart = gets.chomp
        if restart == "y"
            newGame = Game.new
            newGame.start
        else 
            puts "See you next time :D"
            exit
        end
    end
end