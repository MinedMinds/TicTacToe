#print "Current Board"
#print visualization of board
#put in a function
#pass a message to print
#ask player 1 whether they want marker X or O
#display the choice
#determine player 2 marker and print what that is
#put setting of player markers in a function
#ask Player 1 where they want to move
#print where player 1 chooses to go
#modify board function to take in board_arrays
#update current_board with player choice and display updated board


def board(message, board_array)

	puts message

	puts """
	   |   |   
	 #{board_array[0]} | #{board_array[1]} | #{board_array[2]} 
	___|___|___
	   |   |   
	 #{board_array[3]} | #{board_array[4]} | #{board_array[5]} 
	___|___|___
	   |   |   
	 #{board_array[6]} | #{board_array[7]} | #{board_array[8]} 
	   |   |   
	"""
end

def set_player1_marker
	puts "Player 1 - do you want to be X or O?"
	gets.chomp.upcase
end

def set_player2_marker(player1_marker)
	if player1_marker == "X"
		"O"
	else
		"X"
	end
end

def set_player_markers
	@player1_marker = set_player1_marker
	@player2_marker = set_player2_marker(@player1_marker)
	puts "Player 1 is #{@player1_marker} and Player 2 is #{@player2_marker}"
end



board_positions_array = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]


board("Welcome to Tic Tic Toe. These are the board positions:", board_positions_array)

current_board_array = Array.new(9, " ")
board("This is the current board:",current_board_array)

set_player_markers

puts "Player 1 (#{@player1_marker}) - please choose a square between 0 and 8"
move = gets.to_i

current_board_array[move] = "#{@player1_marker}"
board("player 1 (#{@player1_marker}) chose space #{move}", current_board_array)
