require 'pry'
require_relative 'DifferentCurrencyCodeError'

class Currency < DifferentCurrencyCodeError
  
  attr_accessor :currency_id, :amount

  def initialize currency_id, amount
    @currency_id = currency_id
    @amount = amount
  end

  # displays the contents of currency objects
  def to_s
    "#{currency_id}: #{amount.to_f}"
  end

  # compares two currency objects
  def <=> currency
    if self.currency_id == currency.currency_id
      true
    else
      raise DifferentCurrencyCodeError
    end
  end

  # adds two currency amounts together
  def + obj2
    if self.currency_id == obj2.currency_id
      return Currency.new(currency_id,self.amount + obj2.amount)
    else
      raise DifferentCurrencyCodeError
    end
  end

  # subtracts two currency amounts
  def - obj2
    if self.currency_id == obj2.currency_id # checks if currency are the same
      # Checks for Negative Currency
      if (self.amount - obj2.amount >= 0) && (obj2.amount - self.amount >= 0)
        return Currency.new(currency_id,self.amount - obj2.amount)
      else
        "You can not have negative currency."
      end
    else
      raise DifferentCurrencyCodeError
    end
  end
  

end

begin
  puts currency1 = Currency.new("US", 1)
  puts currency2 = Currency.new("US", 0.23)
  puts currency1.currency_id == currency2.currency_id

  new_currency = currency2 + currency1
  puts new_currency
rescue
  puts "You fucked up"
end


