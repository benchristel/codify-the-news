class HtmlStripper
  def self.strip string
    string.gsub(/<(script|style).*?>.+?<\/(script|style)>/m, ' ')
          .gsub(/<.+?>/m, ' ')
          .gsub(/[^a-zA-Z0-9 ]/, ' ')
          .gsub(/\s+/, ' ')
  end
end
