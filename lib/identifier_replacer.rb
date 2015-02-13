class IdentifierReplacer
  def self.replace code, words
    code.gsub(/[A-Za-z0-9]+/) do
      words.shift
    end
  end
end
