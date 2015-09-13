require_relative "main.rb"
require "minitest/autorun"

class TTT_Test < Minitest::Test

	def test_set_player2_marker
		game = Game.new
		assert_equal("X", game.set_next_marker("O"))
		assert_equal("O", game.set_next_marker("X"))
	end

	def test_marker_valid?
		game = Game.new
		assert_equal(true, game.marker_valid?("O"))
		assert_equal(true, game.marker_valid?("X"))
		assert_equal(false, game.marker_valid?("Q"))
		assert_equal(false, game.marker_valid?("1"))
	end

	def test_game_over_with_board_full
		game = Game.new
		assert_equal(true, game.game_over?(["X", "O", "X", "O", "X", "O", "X", "O", "X"]))
		assert_equal(false, game.game_over?(["X", " ", "X", "O", "X", "O", "X", "O", "X"]))
	end

	def test_valid_space
		game = Game.new
		board = [" ", "O", "X", "O", "X", "O", "X", "O", "X"]
		assert_equal(true, game.valid_space?(1, board))
		assert_equal(false, game.valid_space?(2, board))
		assert_equal(false, game.valid_space?(0, board))
		assert_equal(false, game.valid_space?(10, board))
	end
end
