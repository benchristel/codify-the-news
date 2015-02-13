class HtmlStripper
  def self.strip string
    string = string.gsub(/<(script|style).*?>.*?<\/(script|style)>/m) { |match|
      #  puts '\n-----------------------------------------\n'
      #  puts match
      ' '
    }
    # puts "AFTER STEP 1" + "="*120
    # puts string
    string = string.gsub(/<.+?>/m, ' ')
    # puts "AFTER STEP 2" + "="*120
    # puts string
    string = string.gsub(/[^a-zA-Z0-9 ]/, ' ')
    # puts "AFTER STEP 3" + "="*120
    # puts string
    string = string.gsub(/\s+/, ' ')
    # puts "AFTER STEP 4" + "="*120
    # puts string
    # string

    Nokogiri::HTML(string).text
  end
end
