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

    def buy_drink(drink, customer)
      customer.add_drink(drink)
      customer.spend_money(drink)
      sell_drink(drink)
      add_money(drink)
      customer.increase_drunkenness(drink)
    end

    def of_age(customer)
      if customer.age >= 18
        return "Aye there ye go wee man!"
      else
        return "Naw! Bolt!"
      end
    end

    def service(customer, drink)
      if customer.drunkenness >= 10
        return "Stomach pumped mate!"
      else
        buy_drink(drink, customer)
        return "Here ye go mate!"

      end
    end

end
