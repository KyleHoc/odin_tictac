class Board
    @slot1 = "1"
    @slot2 = " 2 "
    @slot3 = "3"
    @slot4 = "4"
    @slot5 = " 5 "
    @slot6 = "6"
    @slot7 = "7"
    @slot8 = " 8 "
    @slot9 = "9"

    def print_board()
        puts "#{@slot1}#{@slot2}#{@slot3}"
        puts "#{@slot4}#{@slot5}#{@slot6}"
        puts "#{@slot7}#{@slot8}#{@slot9}"
    end

    def make_move(player, slot)
    end
end

class Player
    def initialize(symbol, order)
        @symbol = symbol
        @order = order
    end

    def get_info()
        info = [@symbol, @order]
    end
end

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

def begin_game(p1, p2, board)
    p p1.get_info[1]
    if p1.get_info[1] == '1'
        goes_first = p1.get_info
        goes_second = p2.get_info
    else
        goes_first = p2.get_info
        goes_second = p1.get_info
    end
    p goes_first
    p goes_second
    #puts "Player #{goes_first[1]} where would you like to play?"
end

board = Board.new()

select = playerSelect()
player1 = Player.new(select[0], select[1])
player2 = Player.new(select[2], select[3])
p player1.get_info
p player2.get_info

begin_game(player1, player2, board)