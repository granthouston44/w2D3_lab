require ('minitest/autorun')
require ('minitest/rg')
require_relative('../drinks.rb')

class TestDrink < MiniTest::Test

  def setup
    @drink = Drink.new("Tennets", 3, 1)
  end

  def test_drink_name
    assert_equal("Tennets", @drink.name)
  end

  def test_drink_price
    assert_equal(3, @drink.price)
  end

  def test_drink_alcohol
    assert_equal(3, @drink.alcohol)
  end

end
