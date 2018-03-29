module Slugger
  def slug
    self.name.downcase.gsub(" ","-")
  end
  
  def find_by_slug(slug)
    self.all.find{|genre| genre.slug == slug}
  end
end