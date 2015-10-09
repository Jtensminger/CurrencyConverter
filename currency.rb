require 'pry'
require_relative 'DifferentCurrencyCodeError'

class Currency < DifferentCurrencyCodeError
  
  attr_accessor :currency_id, :amount, :currency_symbol, :amount_convert

  CURRENCY = {
    "$" => {symbol: "USD", rate: 1.0},
    "€" => {symbol: "EUR", rate: 1.02}
  }


  def initialize currency_id, amount = 0
    if  
    @currency_symbol = currency_id[/\A\W/]
    @currency_id = currency_id
    @amount = currency_id[/\d\W\d{2}/]
  end
  
  # displays the contents of currency objects
  def to_s
    "#{currency_id}: #{amount.to_f}"
  end

  # compares two currency objects
  def <=> currency
    if self.currency_id == currency.currency_id
      self.amount <=> currency.amount
    else
      self.currency_id <=> currency.currency_id
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
  
  # multiplies currency and a float
  def * obj2
    if self.currency_id == obj2.currency_id
      return Currency.new(currency_id,self.amount * obj2.amount)
    else
      raise DifferentCurrencyCodeError
    end

  end

end

begin
  currency1 = Currency.new("USD", 1)
  currency2 = Currency.new("USD", 0.23)
  currency3 = Currency.new("$1.00")
  #puts currency1.currency_id == currency2.currency_id
  #puts currency3.currency_id
  #puts currency3.amount
  #puts currency3.currency_symbol
 # new_currency = currency2 * currency1
  #puts new_currency

rescue DifferentCurrencyCodeError
  puts "You fucked up"
end


