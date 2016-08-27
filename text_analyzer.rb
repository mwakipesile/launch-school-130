class TextAnalyzer
  def process
    file = File.open('sample.txt', 'r')
    yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts file.split("\n\n").size }
analyzer.process { |file| p file.gsub("\n\n", "\n").split("\n").size }
analyzer.process { |file| puts file.split(" ").size  }
