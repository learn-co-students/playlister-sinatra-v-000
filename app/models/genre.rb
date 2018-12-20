class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres


  @@slug_name = Hash.new

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
    self.save
    @slug
  end

  def self.find_by_slug(slug)
    self.all.find(slug) {|name| name.slug == slug}
  end

end
