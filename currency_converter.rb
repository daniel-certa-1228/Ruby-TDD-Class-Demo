class CurrencyConverter

  attr_accessor :currency_one, :currency_two, :conversion_rate, :reverse_conversion_rate

  def initialize(currency_one, currency_two, conversion_rate)
    # added to_f to covert @conversion_rate string to numbers
    @currency_one = currency_one
    @currency_two = currency_two
    @conversion_rate = conversion_rate.to_f
  end

  def convert_currency_one_to_two(amount)
    amount.to_f * @conversion_rate
  end

  def convert_currency_two_to_one(amount)
    if @reverse_conversion_rate
      amount.to_f * @reverse_coversion_rate
    else
      amount.to_f * self.reverse_conversion_rate
    end
  end

  def reverse_conversion_rate
    @reverse_coversion_rate = 1.0/@conversion_rate
  end
end
