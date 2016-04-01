class Slugifiable
  
  def self.slug(text)
    x = text.downcase.gsub(/[^a-z ]/,"").gsub(" ","-")
  end
end