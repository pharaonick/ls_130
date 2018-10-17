require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text_class'

class TextTest < Minitest::Test
  def setup
    @file = File.new('sample_text.txt')
    @text = @file.read
    @text_object = Text.new(@text)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

  def test_swap
    assert_equal(@text.gsub('a', 'e'), @text_object.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(@text.split.count, @text_object.word_count)
  end

  def test_word_count_manually
    assert_equal(72, @text_object.word_count)
  end
end

# note LS did the expected assertion by writing it out longhand...
# that means the setup can be more direct because can instantiate 
# Text by invoking `@text_object = Text.new(@file.read)` because don't 
# need `@text`
# also means can put some of the setup code within the test code

# it is prolly best just to create the file in setup and do the rest in test
# ALSO, check out Bernard's solution!
# in fact there are a number of ways to do this, e.g. counting before/after