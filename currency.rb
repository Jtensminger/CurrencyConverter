require 'pry'

class Currency
  
  attr_accessor :currency_id, :amount

  def initialize currency_id, amount
    @currency_id = currency_id
    @amount = amount
  end
  
end