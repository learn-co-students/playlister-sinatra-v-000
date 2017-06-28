class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

	# def slug
	# 	name.downcase.squish.gsub(" ","-")
	# end
  #
	# def self.find_by_slug(slug)
	# 	Song.all.find{|song| song.slug == slug}
	# end

end
