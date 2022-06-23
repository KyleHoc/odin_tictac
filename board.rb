class Board
    def initialize()
      @slot = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    end

    def print_board()
        puts ""
        puts "#{@slot[0]} #{@slot[1]} #{@slot[2]}"
        puts "#{@slot[3]} #{@slot[4]} #{@slot[5]}"
        puts "#{@slot[6]} #{@slot[7]} #{@slot[8]}"
        puts ""
    end

    def make_move(symbol, slot)
        slot = slot.to_i - 1
        @slot[slot] = symbol
    end

    def check_victory()
        victory = false
        if (@slot[0] == @slot[1] && @slot[1] == @slot[2])
            victory = true
        end
        if (@slot[3] == @slot[4] && @slot[4] == @slot[5])
            victory = true
        end
        if (@slot[6] == @slot[7] && @slot[7] == @slot[8])
            victory = true
        end
        if (@slot[0] == @slot[3] && @slot[3] == @slot[6])
            victory = true
        end
        if (@slot[1] == @slot[4] && @slot[4] == @slot[7])
            victory = true
        end
        if (@slot[2] == @slot[5] && @slot[5] == @slot[8])
            victory = true
        end
        if (@slot[0] == @slot[4] && @slot[4] == @slot[8])
            victory = true
        end
        if (@slot[2] == @slot[4] && @slot[4] == @slot[6])
            victory = true
        end
        return victory
    end

    def get_slot()
        valid_slot = false

        while valid_slot == false
            slot = gets.strip
            if @slot.include?(slot)
                valid_slot = true
            else
                puts "Invalid input. Try again"
            end
        end
        return slot
    end
end