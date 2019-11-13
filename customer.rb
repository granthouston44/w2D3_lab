class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    @drink = []
  end

  def drink_count
    return @drink.size()
  end

  def add_drink(drink)
    @drink.push(drink)
  end

  def spend_money(drink)
    @wallet -= drink.price
  end

  def buy_drink(drink, pub)
    add_drink(drink)
    spend_money(drink)
    pub.sell_drink(drink)
    pub.add_money(drink)
  end

end
