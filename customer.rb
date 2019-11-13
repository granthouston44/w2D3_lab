class Customer

  attr_reader :name, :wallet, :age, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @drink = []
    @age = age
    @drunkenness = 0
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

  def increase_drunkenness(drink)
    @drunkenness += drink.alcohol
  end

  def eat(food)
    @drunkenness -= food.rejuvenation
  end

end
