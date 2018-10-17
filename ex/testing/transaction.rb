class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  # input: $stdin written like this to make testing a bit easier...
  def prompt_for_payment(input: $stdin, output: $stdout) # calling puts explicitly on output is another way to clean test output up
    loop do
      output.puts "You owe $#{item_cost}.\nHow much are you paying?" #unless input != $stdin (one way to clean up test output)
      @amount_paid = input.gets.chomp.to_f
      break if valid_payment? && sufficient_payment?
      output.puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end