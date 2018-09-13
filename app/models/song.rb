class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
   self.name.parameterize
 end

 def self.find_by_slug(slug)
   self.all.find{|song| song.name.parameterize == slug}
 end
end
