require_relative 'Converter'
require_relative 'Currency'

CURRENCY = {
    "USD" => {"USD" => 1.0, "EUR" => 0.98, "YEN" => 3.0},
    "EUR" => {"EUR" => 1.0, "USD" => 1.02, "YEN" => 3.5},
    "YEN" => {"YEN" => 1.0, "USD" => 0.45, "EUR" => 0.38},
    "$" => {"USD" => 1.0, "EUR" => 0.98, "YEN" => 3.0},
    "€" => {"EUR" => 1.0, "USD" => 1.02, "AUD" => 3.5},
    "¥" => {"YEN" => 1.0, "USD" => 0.45, "EUR" => 0.38}
  }

puts "Please enter your Currency's ID"
before_conversion_ID = gets.chomp
before_conversion_ID = before_conversion_ID[/^\W/]
puts "Please enter amount to be converted"
before_conversion_amount = gets.chomp
before_conversion_amount = before_conversion_amount[/\d\W\d{2}/].to_f
puts "Please enter target currency"
target = gets.chomp


conversion_rates = Converter.new(CURRENCY)
user_money = Currency.new(before_conversion_ID,before_conversion_amount)
puts conversion_rates.convert(user_money, target)