class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
		self.name.downcase.split(" ").join("-")
	end

	def self.find_by_slug(slug_name)
		name = slug_name.split("-").map! {|word| word.capitalize}.join(" ")
		find_by_name(name)
    end
end
