class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

# my_file = File.new("sample_text.txt")
# my_text = my_file.read
# my_file.close

# my_text = File.open("sample_text.txt") { |file| file.read }


# text_instance = Text.new(my_text)
# p text_instance.swap('a', '@')