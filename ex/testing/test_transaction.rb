require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

# require 'stringio' NOT NEEDED BECAUSE STDLIB

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(40)
  end
  
  # def test_prompt_for_payment
  #   $stdin = StringIO.new('100')
  #   @transaction.prompt_for_payment
  #   assert_equal(100.0, @transaction.amount_paid)
  # end

  # more LS version
  def test_prompt_for_payment2
    @transaction.prompt_for_payment(input: StringIO.new('100'), output: StringIO.new)
    assert_equal(100.0, @transaction.amount_paid)
  end

  # above two working slightly differently. 
  # both call StringIO#gets on a StringIO obj
  # first keeps $stdin as input arg, but overrides it -> StringIO obj
  # second changes input arg to the StringIO obj
  # their test output is also different now because of the way the 
  # puts condition is set up 

  # NOTE that if Transaction#prompt_for_payment had been implemented
  # as `prompt_for_payment(input = $stdin)` then we could have simply
  # called `@transaction.prompt_for_payment(StringIO.new('100'))
  # `input: obj` and `input = obj` are analogous, but have to be invoked
  # slightly differently

  # explicitly specifying output as a new StringIO object means that when
  # we call puts on it within the method, it simply stores the string passed
  # to puts within the StringIO obj.

end

# check out some other solutions
# good discussion https://launchschool.com/posts/68d7de2a