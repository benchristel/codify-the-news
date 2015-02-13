class IdentifierReplacer
  def self.replace code, words
    output = ''
    until words.empty?
      output += code.gsub(/[A-Za-z0-9]+/) do |match|
        words.shift || match
      end
    end
    output
  end
end
