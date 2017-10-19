class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs #genre related to song, then song to artist

  def slug
		name.downcase.gsub(" ","-")
	end

	def self.find_by_slug(slug)
	#	binding.pry
		Genre.all.find{|genre| genre.slug == slug}
	end
end
