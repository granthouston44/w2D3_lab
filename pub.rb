class Pub

  attr_reader :name, :till

    def initialize(name, drink)
      @name = name
      @drink = drink
      @till = 0
    end

    def stock_count
      @drink.size()
    end

    def sell_drink(drink)
      @drink.delete(drink)
    end

    def add_money(drink)
      @till += drink.price
    end

end
