require './board' 
require './player'

def playerSelect()
    symbol_choice = false
    order_choice = false
    
    while(symbol_choice == false)
      puts "Player 1, will you be Xs or Os? (Enter 'X' or 'O')"
      symbol_one = gets.strip.upcase

      if symbol_one == 'X'
        symbol_two = 'O'
        symbol_choice = true
      elsif symbol_one == 'O'
          symbol_two = 'X'
          symbol_choice = true
      else
          puts "Invalid input. Try again"
      end
   end

   while(order_choice == false)
    puts "Player 1, will you go first or second? (enter '1' or '2')"
    order_one = gets.strip

    if order_one == '1'
      order_two = '2'
      order_choice = true
    elsif order_one == '2'
        order_two = '1'
        order_choice = true
    else
        puts "Invalid input. Try again"
    end
  end

  player_info = [symbol_one, order_one, symbol_two, order_two]
end

def declare_winner(current_player, board)
    board.print_board
    puts "Player #{current_player} wins!"
end

def begin_game(p1, p2, board)
    if p1.get_info[1] == '1'
        goes_first = 1
        goes_second = 2
    else
        goes_first = 2
        goes_second = 1
        temp = p1
        p1 = p2
        p2 = temp
    end

    victory = false
    
    while victory == false
        current_player = goes_first
        puts "Player #{goes_first} which number will you play on?"
        board.print_board
        slot = board.get_slot()
        board.make_move(p1.get_info[0], slot)
        victory = board.check_victory()
        if victory 
          break
        end
        board.print_board

        current_player = goes_second
        puts "Player #{goes_second} which number will you play on?"
        board.print_board
        slot = board.get_slot()
        board.make_move(p2.get_info[0], slot)
        victory = board.check_victory()
        if victory 
          break
        end
        board.print_board
    end

    declare_winner(current_player, board)
end

board = Board.new()

select = playerSelect()
player1 = Player.new(select[0], select[1])
player2 = Player.new(select[2], select[3])

begin_game(player1, player2, board)