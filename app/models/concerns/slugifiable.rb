module Slugifiable
  def slug
    slug = self.name.downcase.gsub(" ","-")
  end
end
