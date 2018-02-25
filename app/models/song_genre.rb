class SongGenre < ActiveRecord::Base

  belongs_to :song
  belongs_to :genre

  def slug
    self.name.gsub(" ", "-").downcase
  end
  def self.find_by_slug(slug)
    self.all.find{ |instance| instance.slug == slug}
  end
end
