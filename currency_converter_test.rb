require 'minitest/autorun'
require_relative 'currency_converter'

# 1. Add tests for checking type of parameters passed into initialize. "currency_one" and "currency_two" should be strings. And "conversion_rate" should a number.

# 2. Add tests for checking type of paramter "amount" for both conversion methods. It should be a number.

# 3. The if-else in the convert_currency_two_to_one method needs to be tested. The if else gives you two different sceanrios that can happen and they both need to be tested.

class CurrencyConverterTest < Minitest::Test

  def setup
    @apples_to_oranges = CurrencyConverter.new('Apple', 'Orange', 2)
    @amount = 5
  end

  def test_initialize
    assert_raises ArgumentError do
      CurrencyConverter.new
    end

    assert_raises ArgumentError do
      CurrencyConverter.new('arg1')
    end

    assert_raises ArgumentError do
      CurrencyConverter.new('arg1', 'arg2')
    end

    @cc = CurrencyConverter.new('Apples', 'Oranges', '2.5')
    assert_equal 'Apples', @cc.currency_one
    assert_equal 'Oranges', @cc.currency_two
    assert_equal 2.5, @cc.conversion_rate
  end
  ###################
  #TEST THE INITIALIZE ARGUMENT FOR TYPE
  def test_initialize_types
    @new_test = CurrencyConverter.new('Apples','Oranges','2')
    assert_instance_of String, @new_test.currency_one
    assert_instance_of String, @new_test.currency_two
    assert_instance_of Float, @new_test.conversion_rate
  end
  ###################
  #TESTING THE AMOUNT TYPES
  def test_amount_types_oneToTwo
    @expected_value_2 = @apples_to_oranges.convert_currency_one_to_two(@amount)
    assert_instance_of Float, @expected_value_2
  end

  def test_amount_types_TwoToOne
    @expected_value_3 = @apples_to_oranges.convert_currency_two_to_one(@amount)
    assert_instance_of Float, @expected_value_3
  end
  ###################
  #TESTING BOTH CONDITIONS
  def test_if_else_statement_IF
    @expected_value_4 = @apples_to_oranges.convert_currency_two_to_one(@amount)
    assert_instance_of Float, @expected_value_4
  end
  def test_if_else_statement_ELSE
    @apples_to_oranges.reverse_conversion_rate
    @expected_value_5 = @apples_to_oranges.convert_currency_two_to_one(@amount)
    assert_instance_of Float, @expected_value_5
  end
  ###################
  def test_convert_currency_one_to_two
    assert_raises ArgumentError do
      @apples_to_oranges.convert_currency_one_to_two
    end

    @converted_value = @apples_to_oranges.convert_currency_one_to_two(@amount)
    @expected_value = @amount * @apples_to_oranges.conversion_rate

    assert_equal @expected_value, @converted_value
  end

  def test_convert_currency_two_to_one
    assert_raises ArgumentError do
      @apples_to_oranges.convert_currency_two_to_one
    end

    @converted_value = @apples_to_oranges.convert_currency_two_to_one(@amount)
    @expected_value = @amount * @apples_to_oranges.reverse_conversion_rate

    assert_equal @expected_value, @converted_value
  end

  def test_reverse_conversion_rate
    assert_raises ArgumentError do
      @apples_to_oranges.reverse_conversion_rate('arg1')
    end
    @expected_value = 1.0/@apples_to_oranges.conversion_rate
    assert_equal @expected_value, @apples_to_oranges.reverse_conversion_rate
  end

end
