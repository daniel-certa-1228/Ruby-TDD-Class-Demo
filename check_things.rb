require_relative 'currency_converter'

@test_cc = CurrencyConverter.new('Apple', 'Orange', 2)

check = @test_cc.convert_currency_one_to_two('4')
p check
check_2 = @test_cc.convert_currency_two_to_one('4')
p check_2