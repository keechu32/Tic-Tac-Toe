class TicTacToe
    def initialize()
        puts "Let's Play some Tic-Tac-Toe \nIt will really test your tictacs!"
        puts "Enter player name!"
        @player1=gets.chomp 
        puts "Enter the piece you want!"
        @piece1=gets.chomp
        puts "Enter the piece the computer should have!"
        @piece2=gets.chomp
        #makes the board
        @board=Array.new(3){Array.new(3,:empty_cell)}
    end
    private
    def win_conditions
        #win condition for the horizontal lines
        @board.any? do |row|
            return @player1 if @board.all? {|piece| piece==@piece1}
            return @computer_player if @board.all? {|piece| piece==@piece2}
        end
        #win conditions for vertical lines
        index=0
        while index<=2 do |index|
            return @player1 if @board.all? {|row| row[index]==@piece1}
            return @computer_player if @board.all? {|row| row[index]==@piece2}
        end
            index+=1
        end
        #win conditions for diagonal lines
       if (@board[0][0]==@board[1][1] && @board[1][1]==@board[2][2])
           return @player1 if @board[1][1]== @piece1
           return @computer_player if @board[1][1]== @piece2
       elsif (@board[0][2]==@board[1][1] && @board[1][1]==@board[2][0])
            return @player1 if @board[1][1]== @piece1
            return @computer_player if @board[1][1]== @piece2
       end
    end
    def display_the_board
        @board.each do |row|
            #makes the rows and fills the boxes
            row.each_with_index |box,index|
           if box==@piece1
               puts @piece1
           elsif box==@piece2
                puts @piece2
           else
                puts "-"
           end
           #makes the column divisions
           if index<2
               puts "|"
           end
        end
    end
end