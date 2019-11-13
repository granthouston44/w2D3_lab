require('minitest/autorun')
require('minitest/rg')

require_relative('../pub')
require_relative('../drinks')
require_relative('../customer')


class PubTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Jefferson", 60, 18)
    @customer2 = Customer.new("Francis", 20, 15)

    @drink1 = Drink.new("Tennets", 3, 1)
    @drink2 = Drink.new("Strongbow", 4, 1.5)
    @drink3 = Drink.new("Buckie", 6, 4)
    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("Clansman", @drinks)
  end


  def test_pub_name
    assert_equal("Clansman", @pub.name)
  end

  def test_till_empty
    assert_equal(0, @pub.till)
  end

  def test_get_age
    assert_equal(18, @customer1.age)
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

  def test_customer_overage
    #given

    #then
    result = @pub.of_age(@customer1)
    #when
    assert_equal("Aye there ye go wee man!", result)
  end

  def test_custoemr_underage
    result = @pub.of_age(@customer2)
    assert_equal("Naw! Bolt!", result)
  end

  def test_customer_drunkenness_drunk
    @pub.buy_drink(@drink3, @customer1)
    @pub.buy_drink(@drink3, @customer1)
    @pub.buy_drink(@drink3, @customer1)

    result = @pub.service(@customer1, @drink1)

    assert_equal("Stomach pumped mate!", result)
  end

  def test_customer_drunkenness_sober
    result = @pub.service(@customer1, @drink3)
    assert_equal("Here ye go mate!", result)
  end

  def test_customer_drunkenness_sober
    result = @pub.service(@customer2, @drink3)
    assert_equal("Here ye go mate!", result)
  end

  def test_buy_drink
    # @customer1.buy_drink(@drink3, @pub)
    # @customer1.buy_drink(@drink3, @pub)
    # @customer1.buy_drink(@drink3, @pub)
    # @customer1.buy_drink(@drink2, @pub)
    @pub.service(@customer1, @drink3)
    # @pub.service(@customer1, @drink3)
    # @pub.service(@customer1, @drink3)
    @pub.of_age(@customer1)
    assert_equal(1, @customer1.drink_count)
    assert_equal(54, @customer1.wallet)
    assert_equal(2, @pub.stock_count)
    assert_equal(6, @pub.till)
    assert_equal(4, @customer1.drunkenness)
  end

  def test_buy_drink_not_served
    @pub.service(@customer1, @drink3)
    @pub.service(@customer1, @drink3)
    @pub.service(@customer1, @drink3)
    @pub.service(@customer1, @drink3)
    @pub.of_age(@customer1)
    assert_equal(3, @customer1.drink_count)
    assert_equal(42, @customer1.wallet)
    assert_equal(2, @pub.stock_count)
    assert_equal(18, @pub.till)
    assert_equal(12, @customer1.drunkenness)
  end



end
