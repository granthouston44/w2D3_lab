require('minitest/autorun')
require('minitest/rg')

require_relative('../pub')
require_relative('../drinks')


class PubTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Tennets", 3)
    @drink2 = Drink.new("Strongbow", 4)
    @drink3 = Drink.new("Buckie", 6)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("Clansman", @drinks)
  end


  def test_pub_name
    assert_equal("Clansman", @pub.name)
  end

  def test_till_empty
    assert_equal(0, @pub.till)
  end

  def test_drinks_stock
    assert_equal(3, @pub.stock_count)
  end

  def test_remove_drink
    @pub.sell_drink(@drink3)
    assert_equal(2, @pub.stock_count)
  end

  def test_add_money_to_till
    @pub.add_money(@drink3)
    assert_equal(6, @pub.till)
  end


end
