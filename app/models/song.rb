class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :genres, through: :song_genres
	has_many :song_genres


	def slug
		self.name.downcase.gsub(" ", "-")
	end


	def self.find_by_slug(slug)
		name = slug.gsub("-", " ")
		Song.all.find {|song| song.name.downcase == name}
	end


end
