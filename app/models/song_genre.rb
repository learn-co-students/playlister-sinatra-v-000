class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find{|s| s.slug == slug}
  end

end # SongGenre CLASS
