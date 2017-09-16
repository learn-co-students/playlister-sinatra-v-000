class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  def slug
    name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|song| song.slug == slug}
  end
end
