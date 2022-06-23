class Player
    def initialize(symbol, order)
        @symbol = symbol
        @order = order
    end

    def get_info()
        info = [@symbol, @order]
    end
end