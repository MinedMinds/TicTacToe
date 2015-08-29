#print "Current Board"
#print visualization of board
#put in a function
#pass a message to print
#ask player 1 whether they want marker X or O
#display the choice
#determine player 2 marker and print what that is
#put setting of player markers in a function

def board(message)

	puts message

	puts """
	   |   |   
	   |   |   
	___|___|___
	   |   |   
	   |   |   
	___|___|___
	   |   |   
	   |   |   
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
	player1_marker = set_player1_marker
	player2_marker = set_player2_marker(player1_marker)
	puts "Player 1 is #{player1_marker} and Player 2 is #{player2_marker}"
end

board("Welcome to Tic Tac Toe!")
board("Current Board is:")
set_player_markers
