require 'simplecov' # optional
SimpleCov.start # ditto

require 'minitest/autorun'
require 'minitest/reporters' # optional
Minitest::Reporters.use! # ditto

# require class you are testing and all classes it depends on
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(500)
    @transaction = Transaction.new(30)
    @transaction.amount_paid = 50
  end

  def test_accept_money
    assert_equal(550, @register.accept_money(@transaction))
  end
  # NB LS set all the variables up within the test vs in a setup method
  # (which means they are local variables not instance variables)

  def test_change
    assert_equal(20, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $30.\n") { @register.give_receipt(@transaction) }
  end
  # note newline required in expected output because actual output is a puts call

  def test_transaction_class_prompt_for_payment
    @transaction.prompt_for_payment
    assert_equal(100, @transaction.amount_paid) # manually check it...
    
  end
end

