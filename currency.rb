require 'pry'

class Currency
  
  attr_accessor :currency_id, :amount

  def initialize currency_id, amount
    @currency_id = currency_id
    @amount = amount
  end

  def to_s
    "#{currency_id}: #{amount}"
  end

  def <=> currency
    self.currency_id == currency.currency_id
  end


end

puts Currency.new("US", 1).to_s