class TicTacToe
    def initialize()
        puts "Let's Play some Tic-Tac-Toe \nIt will really test your tictacs!"
        puts "Enter player one name!"
        @player1=gets.chomp 
        puts "Enter the piece you want!"
        @piece1=gets.chomp
        puts "Enter player two name!"
        @player2=gets.chomp 
        puts "Enter the piece you want!"
        @piece2=gets.chomp
        #makes the board
        @board=Array.new(3) {Array.new(3,:empty_cell)}
        @turn=Random.rand(0..1)
        @winner=0
    end
    private
    def win_conditions
        #win condition the horizontal lines
        @board.any? do |row|
            if row.all? {|piece| piece==@piece1}
                return @player1
            end
            if row.all? {|piece| piece==@piece2}
                return @player2 
            end
        index_win=0
        while index_win<=2 
            if @board.all? {|row| row[index_win]==@piece1}  
                return @player1 
            elsif @board.all? {|row| row[index_win]==@piece2}
                return @player2 
            end
            index_win+=1
        end
        #win conditions diagonal lines
       if (@board[0][0]==@board[1][1] && @board[1][1]==@board[2][2])
           if @board[1][1]==@piece1
               return @player1
           end
           if @board[1][1]==@piece2
            return @player2
            end
       elsif (@board[0][2]==@board[1][1] && @board[1][1]==@board[2][0])
        if @board[1][1]==@piece1
            return @player1
        end
        if @board[1][1]==@piece2
            return @player2
        end
       end
        end
        return 0
    end
    def display_the_board
        @board.each do |row|
            #makes the rows and fills the boxes
            row.each_with_index do |box, index|
                if box==@piece1
                    print @piece1
                elsif box==@piece2
                    print @piece2
                else
                    print "_"
                end
           #makes the column divisions
                if index<2
                    print " | "
                end
            end
            puts
        end
    end
    def move(row,column)
        if @board[row][column]!= :empty_cell
            invalid_move
            return false
        end
       if @turn==0
        @board[row][column]=@piece1
       elsif @turn==1
        @board[row][column]=@piece2
       end
    end
    def invalid_move
        puts "\nThe cell isn't empty :(\n" 
    end
    def invalid_input
        puts "\nThe input is incorrect :(\n"
    end
    def switch_move
        if @turn==0
            @turn=1
        else
            @turn=0
        end
        return @turn
    end
    public
    def play_game()
        puts "Starting game between #{@player1} and #{@player2}"
        until @winner !=0 do
            puts 
            display_the_board
            puts @turn==0 ? "#{@player1}'s turn!" : "#{@player2}'2 turn!"
            puts "Enter Row number!"
            next_turn=Array.new
            next_turn[0] = gets.chomp.to_i 
            puts "Enter Column number!"
            next_turn[1] = gets.chomp.to_i 
            if (next_turn.length!=2 || !(next_turn[0].between?(0,2)) || !(next_turn[1].between?(0,2)) )
                invalid_input
                next
            end
            make_move=move(next_turn[0],next_turn[1])
            unless make_move
                next
            end
            @winner=win_conditions
            unless @winner==0
                puts "\n#{@winner} WINS!\n"
                display_the_board
            end
            switch_move
        end
    end
end
new_game = TicTacToe.new()
new_game.play_game
