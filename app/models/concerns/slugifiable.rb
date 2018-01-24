module Slugify
  
  def slug(name)
    name.split(" ").join("-")
  end

  def find_by_slug(name)
    self.find_by(name: slug(name))
  end

end
