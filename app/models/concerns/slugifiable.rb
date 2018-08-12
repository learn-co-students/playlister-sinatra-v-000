class Slugifiable < ActiveRecord::Base

  def slugify
    @artist.slugify
  end

  def find_by_slug(slug)
    @artist.find_by(slugify)
      @artist.slugify
  end


end
