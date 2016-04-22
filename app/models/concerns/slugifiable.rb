module Slugifiable

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def find_by_slug(slug)
    self.all.find do |song|
      song.slug == slug
    end
  end

end