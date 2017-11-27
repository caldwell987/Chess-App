class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games
  has_many :pieces
  has_many :messages

  after_create :lay_out_board!

  def contains_piece?(x_coord, y_coord)
    if pieces.where("(x_coord = ? AND y_coord = ?)", x_coord, y_coord).any?
      return true
    else
      return false
    end
  end

  def lay_out_board!
    # WHITE PIECES
      # Pawns
      (1..8).each do |x_coord|
        Pawn.create(game_id: id, white: true, x_coord: x_coord, y_coord: 7, user_id: white_player_user_id, name: "Pawn_white")
      end

      # Rooks
      [1, 8].each do |x_coord|
        Rook.create(game_id: id, white: true, x_coord: x_coord, y_coord: 8, user_id: white_player_user_id, name: "Rook_white")
      end

      # Knights
      [2, 7].each do |x_coord|
        Knight.create(game_id: id, white: true, x_coord: x_coord, y_coord: 8, user_id: white_player_user_id, name: "Knight_white")
      end

      #Bishops
      [3, 6].each do |x_coord|
        Bishop.create(game_id: id, white: true, x_coord: x_coord, y_coord: 8, user_id: white_player_user_id, name: "Bishop_white")
      end

      #King
      King.create(game_id: id, white: true, x_coord: 5, y_coord: 8, user_id: white_player_user_id, name: "King_white")

      #Queen
      Queen.create(game_id: id, white: true, x_coord: 4, y_coord: 8, user_id: white_player_user_id, name: "Queen_white")

    # BLACK PIECES
      # Pawns
      (1..8).each do |x_coord|
        Pawn.create(game_id: id, white: false, x_coord: x_coord, y_coord: 2, user_id: black_player_user_id, name: "Pawn_black")
      end

      # Rooks
      [1, 8].each do |x_coord|
        Rook.create(game_id: id, white: false, x_coord: x_coord, y_coord: 1, user_id: black_player_user_id, name: "Rook_black")
      end

      # Knights
      [2, 7].each do |x_coord|
        Knight.create(game_id: id, white: false, x_coord: x_coord, y_coord: 1, user_id: black_player_user_id, name: "Knight_black")
      end

      #Bishops
      [3, 6].each do |x_coord|
        Bishop.create(game_id: id, white: false, x_coord: x_coord, y_coord: 1, user_id: black_player_user_id, name: "Bishop_black")
      end

      #King
      King.create(game_id: id, white: false, x_coord: 5, y_coord: 1, user_id: black_player_user_id, name: "King_black")

      #Queen
      Queen.create(game_id: id, white: false, x_coord: 4, y_coord: 1, user_id: black_player_user_id, name: "Queen_black")
  end


  def white_player
    User.find_by_id(white_player_user_id)
  end

  def black_player
    User.find_by_id(black_player_user_id)
  end

  def winner
    User.find_by_id(winner_user_id)
  end

  def loser
    User.find_by_id(loser_user_id)
  end

  def notation
    black = black_player_user_id
    white = white_player_user_id



    x = { 1 => "a", 2 => "b", 3 => "c", 4 => "d", 5 => "e", 6 => "f", 7 => "g", 8 => "h" }
    y = { 1 => "8", 2 => "7", 3 => "6", 4 => "5", 5 => "4", 6 => "3", 7 => "2", 8 => "1" }
    piece = { "King" => "K", "Queen" => "Q", "Bishop" => "B", "Knight" => "N", "Rook" => "R", "Pawn" => " " }

    location = "#{piece}" + "#{x}" + "#{y}"

    puts "#{location.white} / #{location.black}"

   
    get new x coord, new y_coord
      convrt to notiation
      puts 



  end




end
