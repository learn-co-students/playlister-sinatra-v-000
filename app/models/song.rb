class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
		a = []
		a = self.name.split(" ")
		self.slug_string = a.join("-").downcase
		self.save
		self.slug_string
	end

	def self.find_by_slug(slug)
		# a = []
		# name = ""
		# a = slug.split("-")
		# a.each do |s|
		# 	name << s.capitalize + " "
		# end
		# Song.find_by_name(name.strip)
		Song.find_by(slug_string: slug)
	end
end