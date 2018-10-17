require 'minitest/autorun' # loads all necessary files from `minitest` gem
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car' # require file we are testing, from current file's dir

class CarTest < MiniTest::Test # test class must subclass like this to inherit all necessary test-writing methods
  def test_wheels # convention is to begin our test instance methods with "test_"
    car = Car.new # setup the appropriate data/objects to make assertions against
    assert_equal(4, car.wheels) # there are many types of assertions... (params here are expected value and test/actual value & comparision performed using `==`)
  end


  def test_bad_wheels
    skip # skips test; add optional string for custom display message
    car = Car.new
    assert_equal(3, car.wheels)
  end
end

=begin
discrepancy between expected and test values -> `assert_equal` saves the error
and Minitest reports it to you at the end of the test run

often useful to have multiple assertions within one test...
=end