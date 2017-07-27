class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
  	#take the artists name
  	#add '-' instead of spaces
  	@song = self.name
  	@song.parameterize('-')
  end

  def self.find_by_slug(slug)
     Song.all.find do |song|
       song.slug == slug
     end
   end

end