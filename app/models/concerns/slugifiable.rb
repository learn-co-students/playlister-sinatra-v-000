module Slugifiable
  
  def slug
    self.name.gsub(' ', '-').downcase
  end

  def find_by_slug(slug)
    self.all.detect{ |obj| obj.slug == slug  }
  end
end