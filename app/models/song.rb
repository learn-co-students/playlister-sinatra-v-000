class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres #going to access these through the join table
  has_many :genres, through: :song_genres #can access genres through song_genres table

  def slug
		name.downcase.gsub(" ","-")
	end

	def self.find_by_slug(slug)
	#	binding.pry
		Song.all.find{|song| song.slug == slug}
	end
end
