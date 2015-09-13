#August 29th
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

#September 12th
#write test for player2_marker in a new file
#refactor code into functions and check tests pass
#there should be a play_game function
#test for player1_marker just X or O
#write valid_marker? function
#refactor to class and make modifications to tests to initiate class
#create new file to start new Game class and start game
#modify code to make sure game works as it did
#check tests still pass
#test for game over if board full
#write game loop that continues until board full
#write tests for valid space
#modify code so only valid spaces can be chosen
#refactor code so that it is as clean and ordered as you can get it
#try to minimise any duplicated code (eg just have one player move function)


class Game

	

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

	def marker_valid?(marker)
		marker == "X" || marker == "O"
	end

	def set_player1_marker
		puts "Player 1 - do you want to be X or O?"
		marker = gets.chomp.upcase
		if marker_valid?(marker)
			marker
		else
			set_player1_marker
		end
	end

	def set_next_marker(player1_marker)
		if player1_marker == "X"
			"O"
		else
			"X"
		end
	end

	def set_player_markers
		@player1_marker = set_player1_marker
		@player2_marker = set_next_marker(@player1_marker)
		puts "Player 1 is #{@player1_marker} and Player 2 is #{@player2_marker}"
	end

	def print_board_positions
		board_positions_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
		board("Welcome to Tic Tic Toe. These are the board positions:", board_positions_array)
	end

	def start_game
		@current_board_array = Array.new(9, " ")
		print_board_positions
		set_player_markers
		current_player = @player1_marker
		until game_over?(@current_board_array)
			player_move(current_player)
			current_player = set_next_marker(current_player)
		end
		puts "Game over! Goodbye!"
	end

	def game_over?(board)
		if board.include? " "
			false
		else
			true
		end
	end

	def player_move(current_player)
		board("This is the current board:", @current_board_array)
		move = get_move(current_player)
		@current_board_array[move - 1] = "#{current_player}"
		board("#{current_player} chose space #{move}", @current_board_array)
	end

	def get_move(current_player)
		puts "#{current_player} - please choose an available square between 1 and 9"
		move = gets.to_i
		if valid_space?(move, @current_board_array)
			move
		else
			puts "#{move} is not a valid space!"
			get_move(current_player)
		end
	end

	def valid_space?(space, board)
		space >= 1 && space <= 9 && board[space - 1] == " "
	end

end

