# read text from simple text file and pass to block
# => x paragraphs
# => x lines
# => x words



class TextAnalyzer
  def process
    File.open("sample_text.txt") do |file|
      yield(file.read)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |f| puts "#{f.scan(/^\n/).count + 1} grafs" }
analyzer.process { |f| puts "#{f.scan(/\n/).count + 1} lines" }
analyzer.process { |f| puts "#{f.split.count} words" }

# LS solution doesn't use the block in `process`, and uses
# `split` vs `scan`

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

# SEXIEST IS TO:
class TextAnalyzer
  def process(&block)
    File.open('sample.txt', &block)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }