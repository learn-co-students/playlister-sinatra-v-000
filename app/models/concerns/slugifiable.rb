class Slugifiable  
  def slug
    self.name.downcase.gsub(" ","-")
  end
end