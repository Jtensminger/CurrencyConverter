require 'pry'
require_relative 'currency'

class Converter
  def initialize currency_hash
    @currency_hash = currency_hash
  end

  def convert currency, target_currency_id
    rate = @currency_hash[currency.currency_id][target_currency_id]
    binding.pry
    target_amount = rate * currency.amount
    return "#{target_currency_id}: #{target_amount}"
  end


end

