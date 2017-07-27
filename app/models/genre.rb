class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
  	#take the artists name
  	#add '-' instead of spaces
  	@genre = self.name
  	@genre.parameterize('-')
  end

  def self.find_by_slug(slug)
     Genre.all.find do |genre|
       genre.slug == slug
     end
   end

end