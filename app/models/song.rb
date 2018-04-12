class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    @slug = self.name.downcase
    if @slug.split.size >1
      @slug.split.join("-")
    end
    #self.slug = @slug
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").map.each do |s|
      s.capitalize
    end
    @song = Song.find_by_name(slug.join(" "))
  end
end
