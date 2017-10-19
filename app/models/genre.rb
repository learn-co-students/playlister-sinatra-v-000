class Genre < ActiveRecord::Base
  has_many :artists, through: :songs #genre related to song, then song to artist
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
		name.downcase.gsub(" ","-")
	end

	def self.find_by_slug(slug)
	#	binding.pry
		Genre.all.find{|genre| genre.slug == slug}
	end
end
