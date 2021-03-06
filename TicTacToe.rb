class Gamesession
  
  def initialize(player_1_score, player_2_score, current_player, player_1, player_2, box)
      @player_1 = player_1
      @player_2 = player_2
      @current_player = @player_1
      @player_1_symbol = "X"
      @player_2_symbol= "O"
      @current_symbol = @player_1_symbol
      @box = [" "] * 9
  end 

  def symbol_assign 
    if @current_player = @player_1
      symbol = "X"
      else
      symbol = "O"
      end
    return "#{@player_1}'s symbol is 'X' and #{@player_2}'s symbol is 'O.'"
  end 

  def two_player_names_input
      puts "Please enter your name, Player 1: "
      @player_1 = user_input_text
      puts "Thank you, #{@player_1}."
      puts "Please enter your name, Player 2: "
      @player_2 = user_input_text
      puts "Thank you, #{@player_2}." 
      puts symbol_assign
  end

  def game_instructions
    system 'clear'
      <<-EOS

      Welcome to Tic Tac Toe!
     
      When it's your turn, enter the numbers below to select a position in the grid.

       1 | 2 | 3
      ---|---|---
       4 | 5 | 6
      ---|---|---
       7 | 8 | 9

       
      Here's what it'd look like if Player 1 (X) plays "2", and Player 2 (O) plays "9":

         | X | 
      ---|---|---
         |   | 
      ---|---|---
         |   | O
      EOS
  end

  def game_begin
      puts game_instructions
      puts two_player_names_input
      puts player1_vs_player2
  end 

  def player1_vs_player2
    loop do
      puts "#{@current_player}, it's your turn. Select a box, 1 through 9!"
      grid 
      puts user_play
      system 'clear'
      
      if winner(@current_player)
        puts "#{@current_player} wins!"
        grid
        puts thanks_for_playing
        exit
        elsif tie_game
      end
      switch_players
      switch_symbols
    end

  end

  def user_play
    user_play = gets.chomp.to_i - 1
      if @box[user_play] == "X" || @box[user_play] == "O"
        puts "Position has already been taken, please choose again!"
        player1_vs_player2
        puts "Number must be between 1 and 9, please choose again."
      elsif user_play >= 10
        player1_vs_player2
      else
        if @box[user_play] != "X" || @box[user_play] != "O"  
          @box[user_play] = @current_symbol
        end 
      system 'clear'
      end         
  end  

  def switch_players
    if @current_player == @player_1
      @current_player = @player_2
    elsif @current_player == @player_2
      @current_player = @player_1
    end
  end

  def switch_symbols
    if @current_symbol == @player_1_symbol
      @current_symbol = @player_2_symbol
    elsif @current_symbol == @player_2_symbol
      @current_symbol= @player_1_symbol
    end
  end

  def grid
    puts "\n\n"
    puts "     #{@box[0]} |  #{@box[1]}  |  #{@box[2]} "
    puts "   ----|-----|---- "
    puts "     #{@box[3]} |  #{@box[4]}  |  #{@box[5]} "
    puts "   ----|-----|---- "
    puts "     #{@box[6]} |  #{@box[7]}  |  #{@box[8]} "    
    puts "\n\n"
  end

  def winner(current_symbol)
    win_move = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,6], [0,4,8], [2,4,6]]
    win_move.any? do |m|
      m.all? {|user_play| @box[user_play] == @current_symbol}
      end
  end

  def tie_game
    if @box.include?(" ")
    else
      puts "It's a tie game. Better luck next time!"
      puts thanks_for_playing
      exit
    end   
  end

  def user_input_text()
      gets.chomp.downcase.capitalize
  end  

  def thanks_for_playing
      <<-EOS 

      Thanks for playing!!! Eager to discuss this code with you soon. 

      --Michael Sterling
      
      EOS
  end
end 

new_game = Gamesession.new("Player 1", "Player 2", "Current player", 0, 0, 0)
new_game.game_begin





