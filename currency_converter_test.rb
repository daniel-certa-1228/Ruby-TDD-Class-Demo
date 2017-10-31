require 'minitest/autorun'
require_relative 'currency_converter'

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

    @cc = CurrencyConverter.new('arg1', 'arg2', 'arg3')
    assert_equal "arg1", @cc.currency_one
    assert_equal "arg2", @cc.currency_two
    assert_equal "arg3", @cc.conversion_rate
  end

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

    conversion_rate = @apples_to_oranges.conversion_rate
    @expected_value = @amount * (1.0 / conversion_rate)

    assert_equal @expected_value, @converted_value

  end

end
