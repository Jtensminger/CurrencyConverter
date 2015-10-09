require 'pry'
require_relative 'currency'
class Converter

  attr_reader :currency_hash

  def initialize currency_hash
    @currency_hash = currency_hash
  end

end