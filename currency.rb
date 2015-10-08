require 'pry'

class Currency
  
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
    self.currency_id == currency.currency_id
  end

  # adds two currency amounts together
  def + obj2
    if self.currency_id == obj2.currency_id
      return Currency.new(currency_id,self.amount + obj2.amount)
    else
      "Two currency's are not the same"
    end
  end

  
  def - obj2
    if self.currency_id == obj2.currency_id
      if (self.amount - obj2.amount >= 0) && (obj2.amount - self.amount >= 0)
        return Currency.new(currency_id,self.amount - obj2.amount)
      else
        "You can not have negative currency."
      end
    else
      "Two currency's are not the same."
    end
  end
  

end

puts currency1 = Currency.new("US", 1)
puts currency2 = Currency.new("US", 0.23)
puts currency1.currency_id == currency2.currency_id
new_currency = currency2 - currency1

puts new_currency