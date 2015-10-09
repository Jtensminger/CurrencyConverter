require 'pry'
require_relative 'currency'

class Converter
  def initialize currency_hash
    @currency_hash = currency_hash
  end

  def convert currency, target_currency_id
    rate = @currency_hash[currency.currency_id][target_currency_id]
    target_amount = rate * currency.amount
    return "#{target_currency_id}: #{target_amount}"
  end


end

  CURRENCY = {
    "USD" => {"USD" => 1.0, "EUR" => 0.98, "AUD" => 3.0},
    "EUR" => {"EUR" => 1.0, "USD" => 1.02, "AUD" => 3.5},
    "AUD" => {"AUD" => 1.0, "USD" => 0.45, "EUR" => 0.38}
  }

conversion_rates = Converter.new(CURRENCY)
puts johnsmoney = Currency.new('USD', 1.00)
puts conversion_rates.convert(johnsmoney, "AUD")