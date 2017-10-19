class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs #accesses genres through the song_genre table

  def slug
		name.downcase.gsub(" ","-")
	end

	def self.find_by_slug(slug)
	#	binding.pry
		Artist.all.find{|artist| artist.slug == slug}
	end
end
