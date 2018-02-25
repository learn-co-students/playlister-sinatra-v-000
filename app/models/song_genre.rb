class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
<<<<<<< HEAD

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find { |instance| instance.slug == slug}
  end
=======
>>>>>>> 1f9fad4566e7bea66933d1080285aea037651e86
end
