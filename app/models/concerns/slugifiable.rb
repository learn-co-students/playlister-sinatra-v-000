class Slugifiable < ActiveRecord::Base
  def slug
    name.downcase.gsub(" ", '-')
  end

  def self.find_by_slug(slug)
    self.all.find{ |song| song.slug == slug }
  end
end
